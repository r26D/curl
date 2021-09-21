FROM alpine:3.14

LABEL "com.github.actions.name"="Wait for Status Action"
LABEL "com.github.actions.description"="Uses Curl to Fetch a URL until the correct status code is returned"
LABEL "com.github.actions.icon"="download-cloud"
LABEL "com.github.actions.color"="gray-dark"

LABEL "repository"="https://github.com/r26d/wait-for-status-action"
LABEL "homepage"="https://github.com/r26d/wait-for-status-action"

RUN apk add --no-cache curl ca-certificates bash

ADD *.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
