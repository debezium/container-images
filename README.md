[![Build Status](https://github.com/debezium/docker-images/actions/workflows/image-builds-auth.yml/badge.svg?branch=master)](https://github.com/debezium/docker-images/actions/workflows/image-builds-auth.yml)
[![License](http://img.shields.io/:license-mit-brightgreen.svg)](https://opensource.org/licenses/MIT)
[![DockerHub](http://img.shields.io/:images-dockerhub-brightgreen.svg)](https://hub.docker.com/r/debezium/)

This repository contains the primary Docker images for Debezium, and they are automatically built and published on [DockerHub](https://hub.docker.com/r/debezium/).

# What is Debezium?

Debezium is a distributed platform that turns your existing databases into event streams, so applications can quickly react to each row-level change in the databases. Debezium is built on top of Kafka and provides Kafka Connect compatible connectors that monitor specific database management systems. Debezium records the history of data changes in Kafka logs, so your application can be stopped and restarted at any time and can easily consume all of the events it missed while it was not running, ensuring that all events are processed correctly and completely.

Debezium is open source under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html)

# Purpose of the Debezium UI
The Debezium UI provides standalone web application, which connects to Kafka Connect via its REST API. See the [Debezium UI docs](https://debezium.io/documentation/reference/operations/debezium-ui.html) for more information

# Configure the Debezium UI
The following table shows the environment variables for the [Debezium UI container image](https://hub.docker.com/r/debezium/debezium-ui) and the related parameter names inside `application.properties` when running the Java application without the container.

<table id="debezium">
  <thead>
    <tr>
      <th>Environment variable</th>
      <th>Parameter name in application.properties</th>
      <th>Default value</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td valign="top"><a id="DEPLOYMENT_MODE">DEPLOYMENT_MODE</a></td>
      <td valign="top">deployment.mode</td>
      <td valign="top">default</td>
      <td valign="top">Specifies how the Debezium UI is deployed.<br>For example, in some environments it might not be possible to reach the underlying backend, Kafka Connect REST interface or databases, then the deployment mode can be switched to match the underlying infrastructure.<br><br><code>default</code>: The default deployment mode. It uses the Debezium UI backend with the configured Kafka Connect clusters via the Kafka Connect REST interface (see <a href="#KAFKA_CONNECT_URI">KAFKA_CONNECT_URI</a> how they are configured).
      <br><br> <code>validation.disabled</code>: When set to validation.disabled the UI frontend will not call the backend to validate the user input nor check the availability and proper configuration of database connections. That mode is used to only generate the Debezium connector JSON configuration without the UI backend validation.<br>
      </td>
    </tr>
    <tr>
        <td valign="top"><a id="KAFKA_CONNECT_URI">KAFKA_CONNECT_URI</a></td>
        <td valign="top">kafka.connect.uri</td>
        <td valign="top">http://connect:8083</td>
        <td valign="top">A comma-separated list to one or more URLs of Kafka Connect REST interfaces to specify the Kafka Connect clusters that should be managed by the Debezium UI.</td>
    </tr>        
  </tbody>
</table>

# License

The Dockerfiles, scripts, and other files in this Git repository are licensed under the [MIT license](https://opensource.org/licenses/MIT). However, the resulting Docker images contain software licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0.html) and other licenses (see specific Docker images for details).

# Tutorial for running Debezium with Docker

We have a [tutorial](https://debezium.io/documentation/reference/tutorial.html) that walks you through running Debezium using Docker. Give it a go, and [let us know what you think](https://debezium.io/community/)!
