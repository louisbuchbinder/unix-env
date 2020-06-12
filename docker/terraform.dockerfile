FROM hashicorp/terraform:0.12.21
RUN \
  set -e; \
  apk update; \
  apk add jq;
