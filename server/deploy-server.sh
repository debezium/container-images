for folder in */; do
    echo $folder
    VERSION=${folder%?};
    echo "Building debezium-server:$VERSION";
    docker build -t artielabs/debezium-server:$VERSION $folder/
    docker push artielabs/debezium-server:$VERSION
done

docker build . -t 1.2
docker push . artielabs/debezium-server:1.2