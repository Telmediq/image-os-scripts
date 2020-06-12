![tag](https://github.com/Telmediq/image-os-scripts/workflows/tag/badge.svg?branch=master)
# OS Scripts
These scripts can be used to:
- deps - uplift vendor docker images so that they contain commonly used binaries.
- user - Create an application user, create /opt/app and assign permissions.

## How to update
Create branch, open a PR once validated and merged into master a new release will be created and the "latest" will be updated.

## Alpine
Alpine does not come with bash, so you need to install it.
 ```dockerfile
WORKDIR /tmp
RUN set -ex && \
    export OS_SCRIPT_REPO_URL=https://raw.githubusercontent.com/Telmediq/image-os-scripts && \
    apk add --no-cache bash && \
    wget -O - ${OS_SCRIPT_REPO_URL}/master/alpine-deps.bash | bash && \
    wget -O - ${OS_SCRIPT_REPO_URL}/master/alpine-user.bash | bash && \
    unset OS_SCRIPT_REPO_URL
```
