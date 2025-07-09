#!/bin/bash

# Function to convert release tag to semver
convert_to_semver() {
    local release_tag="$1"

    # Extract base version (everything before the first dot after the patch number)
    local base_version
    base_version=$(echo "$release_tag" | sed -E 's/^([0-9]+\.[0-9]+\.[0-9]+)\..*$/\1/')

    # Check if it's a Final release (no pre-release suffix)
    if [[ "$release_tag" =~ \.Final$ ]]; then
        echo "$base_version"
    else
        # Extract pre-release part (everything after base version)
        local prerelease_part
        prerelease_part=$(echo "$release_tag" | sed -E "s/^$base_version\.(.*)$/\1/")

        # Convert to lowercase and replace dots with hyphens for semver
        local semver_prerelease
        semver_prerelease=$(echo "$prerelease_part" | tr '[:upper:]' '[:lower:]')

        echo "$base_version-$semver_prerelease"
    fi
}