#!/usr/bin/env bash
# Smoke test: builds both OTEL-enabled and OTEL-disabled variants from the
# local Dockerfile and verifies each behaves correctly.
#
# Usage:  ./smoke-test.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
RUN_ID="$(od -An -N4 -tx1 /dev/urandom | tr -d ' \n')"
IMAGE_OTEL="debezium-smoke-${RUN_ID}:otel"
IMAGE_NO_OTEL="debezium-smoke-${RUN_ID}:no-otel"
CONTAINER="debezium-smoke-${RUN_ID}"
CONTAINER2="debezium-smoke-${RUN_ID}-2"
LOG_FILE="/tmp/debezium-smoke-${RUN_ID}.log"
WAIT_SECONDS=20
PASS=0
FAIL=1
ERRORS=0

# ── Helpers ──────────────────────────────────────────────────────────────────

pass() { echo "  PASS: $*"; }
fail() { echo "  FAIL: $*"; ERRORS=$(( ERRORS + 1 )); }

cleanup() {
    docker rm -f "$CONTAINER"          >/dev/null 2>&1 || true
    docker rm -f "$CONTAINER2"         >/dev/null 2>&1 || true
    docker rmi -f "$IMAGE_OTEL"        >/dev/null 2>&1 || true
    docker rmi -f "$IMAGE_NO_OTEL"     >/dev/null 2>&1 || true
    rm -f "$LOG_FILE"
}
trap cleanup EXIT

# ── Build ─────────────────────────────────────────────────────────────────────

echo "==> Building images (run-id: ${RUN_ID})"
echo ""

echo "  Building ${IMAGE_OTEL} (OTEL_ENABLED=yes)..."
docker build --build-arg OTEL_ENABLED=yes -t "$IMAGE_OTEL" "$SCRIPT_DIR" >/dev/null 2>&1
echo "  Building ${IMAGE_NO_OTEL} (OTEL_ENABLED=no)..."
docker build --build-arg OTEL_ENABLED=no  -t "$IMAGE_NO_OTEL" "$SCRIPT_DIR" >/dev/null 2>&1
echo ""

# ─────────────────────────────────────────────────────────────────────────────
# Suite 1 — OTEL_ENABLED=yes
# ─────────────────────────────────────────────────────────────────────────────

echo "==> [otel] OTEL_ENABLED=yes"
echo ""

# 1.1 Agent JAR present
echo "[1/4] Agent JAR present in image..."
if docker run --rm --entrypoint "" "$IMAGE_OTEL" test -f /debezium/otel/opentelemetry-javaagent.jar; then
    pass "agent JAR found at /debezium/otel/opentelemetry-javaagent.jar"
else
    fail "agent JAR not found"
fi
echo ""

# 1.2 run.sh contains javaagent line
echo "[2/4] run.sh wired with javaagent..."
RUNSH=$(docker run --rm --entrypoint "" "$IMAGE_OTEL" cat /debezium/run.sh)
if echo "$RUNSH" | grep -q "javaagent:/debezium/otel/opentelemetry-javaagent.jar"; then
    pass "javaagent injected into JAVA_OPTS in run.sh"
else
    fail "javaagent not found in run.sh"
fi
echo ""

# 1.3 Agent actually initialises at runtime
echo "[3/4] Agent initialises at runtime (logging exporter, ${WAIT_SECONDS}s)..."
docker run -d --name "$CONTAINER" \
    -e OTEL_TRACES_EXPORTER=logging \
    -e OTEL_METRICS_EXPORTER=logging \
    -e OTEL_LOGS_EXPORTER=logging \
    -e OTEL_SERVICE_NAME=debezium-smoke-test \
    "$IMAGE_OTEL" >/dev/null

sleep "$WAIT_SECONDS"
docker logs "$CONTAINER" >"$LOG_FILE" 2>&1 || true
docker rm -f "$CONTAINER" >/dev/null 2>&1 || true

if grep -q "otel.javaagent" "$LOG_FILE"; then
    AGENT_VERSION=$(grep "otel.javaagent" "$LOG_FILE" | grep -o "version: [0-9.]*" | head -1)
    pass "agent initialised ($AGENT_VERSION)"
else
    fail "no [otel.javaagent] banner in container logs"
    echo "  --- first 20 lines ---"
    head -20 "$LOG_FILE" | sed 's/^/  /'
fi

if grep -q "LoggingMetricExporter\|LoggingSpanExporter\|telemetry.distro" "$LOG_FILE"; then
    pass "OTEL SDK exported telemetry"
else
    fail "no exporter output found"
fi
echo ""

# 1.4 Agent survives a user-supplied JAVA_OPTS override
echo "[4/4] Agent survives JAVA_OPTS override at runtime (${WAIT_SECONDS}s)..."
docker run -d --name "$CONTAINER2" \
    -e JAVA_OPTS="-Xmx256m" \
    -e OTEL_TRACES_EXPORTER=logging \
    -e OTEL_METRICS_EXPORTER=logging \
    -e OTEL_LOGS_EXPORTER=logging \
    -e OTEL_SERVICE_NAME=debezium-smoke-test \
    "$IMAGE_OTEL" >/dev/null

sleep "$WAIT_SECONDS"
docker logs "$CONTAINER2" >"$LOG_FILE" 2>&1 || true
docker rm -f "$CONTAINER2" >/dev/null 2>&1 || true

if grep -q "otel.javaagent" "$LOG_FILE"; then
    pass "agent still initialised when JAVA_OPTS=-Xmx256m is set at runtime"
else
    fail "agent lost after JAVA_OPTS override — javaagent may have been overwritten"
    echo "  --- first 20 lines ---"
    head -20 "$LOG_FILE" | sed 's/^/  /'
fi
echo ""

# ─────────────────────────────────────────────────────────────────────────────
# Suite 2 — OTEL_ENABLED=no
# ─────────────────────────────────────────────────────────────────────────────

echo "==> [no-otel] OTEL_ENABLED=no"
echo ""

# 2.1 Agent JAR absent
echo "[1/2] Agent JAR absent from image..."
if docker run --rm --entrypoint "" "$IMAGE_NO_OTEL" test -f /debezium/otel/opentelemetry-javaagent.jar; then
    fail "agent JAR found but should not be present"
else
    pass "agent JAR correctly absent"
fi
echo ""

# 2.2 run.sh does not contain javaagent
echo "[2/2] run.sh has no javaagent in JAVA_OPTS..."
RUNSH=$(docker run --rm --entrypoint "" "$IMAGE_NO_OTEL" cat /debezium/run.sh)
if echo "$RUNSH" | grep -q "javaagent"; then
    fail "javaagent found in run.sh but should not be present"
    echo "$RUNSH" | grep "javaagent" | sed 's/^/  /'
else
    pass "run.sh is clean — no javaagent in JAVA_OPTS"
fi
echo ""

# ─────────────────────────────────────────────────────────────────────────────
# Result
# ─────────────────────────────────────────────────────────────────────────────

if [ "$ERRORS" -eq 0 ]; then
    echo "==> All smoke tests PASSED"
    exit $PASS
else
    echo "==> $ERRORS smoke test(s) FAILED"
    exit $FAIL
fi
