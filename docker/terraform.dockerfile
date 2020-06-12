FROM hashicorp/terraform:0.12.21
RUN \
  set -e; \
  apk update; \
  apk add \
    jq \
    python3 \
    ; \
  pip3 install --upgrade pip; \
  pip3 install awscli --upgrade;
