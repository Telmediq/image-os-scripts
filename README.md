![tag](https://github.com/Telmediq/image-os-scripts/workflows/tag/badge.svg?branch=master)
# OS Scripts
These scripts can be used to:
- deps - Uplift vendor docker images so that they contain commonly used binaries.
- user - Create an application user, create /opt/app and assign permissions.

## How to use
Copy paste the dockerfile entry below, replace the `TMP_VERSION` variables to meet your requirements. Add or remove scripts from this example as necessary.

Stretch (slim) example
```dockerfile
WORKDIR /tmp
RUN     set -ex \
        # Install Bash / Run cloudops script
        && export TMP_VERSION="2020.06.12.21" \
        && export TMP_NAME="image-os-scripts" \
        && export TMP_URL="https://github.com/Telmediq/${TMP_NAME}" \
        && wget -c ${TMP_URL}/archive/${TMP_VERSION}.tar.gz -O - | tar -xz \
        && cat ${TMP_NAME}-${TMP_VERSION}/debian/stretch-deps.bash | bash \
        && cat ${TMP_NAME}-${TMP_VERSION}/debian/stretch-user.bash | bash \
        && rm -rf ${TMP_NAME}-${TMP_VERSION}/ \
        && unset TMP_NAME TMP_URL TMP_VERSION TMP_OS_SCRIPT \
```
