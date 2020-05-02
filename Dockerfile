FROM ubuntu:latest

LABEL "com.github.actions.name"="React Native Android Build APK"
LABEL "com.github.actions.description"="This github action automatically builds the android apk under the artifact section"
LABEL "com.github.actions.icon"="archive"
LABEL "com.github.actions.color"="blue"

LABEL version="1.1.2"
LABEL repository="https://github.com/realabbas/Github-Actions-React-Native"
LABEL homepage="https://github.com/realabbas/Github-Actions-React-Native"
LABEL maintainer="Ali Abbas>"

COPY build /usr/local/bin/build

ENTRYPOINT ["/usr/local/bin/build"]
