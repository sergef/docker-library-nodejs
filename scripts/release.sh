#!/bin/sh

set -e

npm run --if-present=true build
npm test
