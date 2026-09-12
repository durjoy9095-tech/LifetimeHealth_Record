#!/bin/sh
#
# Gradle bootstrap script. Downloads the configured Gradle distribution if needed.
#
APP_HOME=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
WRAPPER_PROPS="$APP_HOME/gradle/wrapper/gradle-wrapper.properties"
DIST_URL=$(sed -n 's/^distributionUrl=//p' "$WRAPPER_PROPS" | sed 's/\\:/:/g')
DIST_FILE="${DIST_URL##*/}"
DIST_NAME="${DIST_FILE%.zip}"
CACHE="$HOME/.gradle/wrapper/dists/$DIST_NAME"
ZIP="$CACHE/$DIST_FILE"

if [ ! -x "$CACHE/$DIST_NAME/bin/gradle" ]; then
  mkdir -p "$CACHE"
  if command -v curl >/dev/null 2>&1; then
    curl -L --fail --retry 3 "$DIST_URL" -o "$ZIP" || exit 1
  elif command -v wget >/dev/null 2>&1; then
    wget -O "$ZIP" "$DIST_URL" || exit 1
  else
    echo "curl or wget is required to bootstrap Gradle."
    exit 1
  fi
  rm -rf "$CACHE/$DIST_NAME"
  unzip -q "$ZIP" -d "$CACHE" || exit 1
fi
exec "$CACHE/$DIST_NAME/bin/gradle" "$@"
