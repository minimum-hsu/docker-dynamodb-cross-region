FROM maven:3.5-jdk-8-alpine as builder
LABEL maintainer s5550055@yahoo.com.tw
ADD https://github.com/awslabs/dynamodb-cross-region-library/archive/1.2.1.tar.gz /usr/src/
WORKDIR /usr/src/dynamodb-cross-region-library-1.2.1
RUN mvn package

FROM java:8-jre-alpine
LABEL maintainer s5550055@yahoo.com.tw
COPY --from=builder /usr/src/dynamodb-cross-region-library-1.2.1/target/dynamodb-cross-region-replication-*.jar /usr/local/share/dynamodb.jar
CMD java -jar /usr/local/share/dynamodb.jar --sourceRegion $SRC_REGION --sourceTable $SRC_TABLE --destinationRegion $DEST_REGION --destinationTable $DEST_TABLE --dontPublishCloudwatch
