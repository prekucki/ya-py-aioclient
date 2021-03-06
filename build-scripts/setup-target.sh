#! /bin/bash 

fail() {
	echo $@ >&2
	exit 1
}

BUILDDIR=target
GENERATOR_VERSION=4.3.1
GENERATOR="$BUILDDIR/openapi-generator-cli.jar"

mkdir "$BUILDDIR"

wget https://repo1.maven.org/maven2/org/openapitools/openapi-generator-cli/${GENERATOR_VERSION}/openapi-generator-cli-${GENERATOR_VERSION}.jar -O "$GENERATOR"

test "$(java -jar "$GENERATOR" version)" == "$GENERATOR_VERSION" || fail "unable to setup openapi generator"

git clone https://github.com/golemfactory/ya-client.git target/ya-client --single-branch

