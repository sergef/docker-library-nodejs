#!/bin/sh

set -e

npm run --if-present=true build
npm run --if-present=true test
