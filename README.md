# Docker base images

## Generic Node.js base image

Not wasting time to configure, develop, build and install new node.js servces.

All services can re-use pre-defined set of npm packages already installed
from the base image:

```json
"dependencies": {
  "async": "^2.5.0",
  "aws-sdk": "^2.126.0",
  "babel-polyfill": "^6.26.0",
  "babel-register": "^6.26.0",
  "babel-runtime": "^6.26.0",
  "bluebird": "^3.5.0",
  "body-parser": "^1.18.2",
  "chrome-remote-interface": "0.25.1",
  "config": "^1.26.2",
  "cookie-parser": "^1.4.3",
  "express": "^4.16.1",
  "express-paginate": "^0.3.0",
  "fs-extra": "^4.0.2",
  "http-status-codes": "1.3.0",
  "js-yaml": "^3.10.0",
  "jsonwebtoken": "^8.0.1",
  "kue": "0.11.6",
  "lodash": "^4.17.4",
  "mime-types": "^2.1.17",
  "moment": "^2.18.1",
  "mongoose": "^4.12.0",
  "mongoose-paginate": "^5.0.3",
  "node-cleanup": "^2.1.2",
  "promise-retry": "^1.1.1",
  "request": "^2.83.0",
  "request-promise": "^4.2.2",
  "response-time": "^2.3.2",
  "s3": "^4.4.0",
  "swagger-client": "^3.2.1",
  "swagger-mongoose": "^1.1.2",
  "swagger-node-runner": "^0.7.3",
  "tmp": "0.0.33",
  "uuid": "^3.1.0",
  "validator": "^9.0.0",
  "yn": "^2.0.0"
},
"devDependencies": {
  "babel-cli": "^6.26.0",
  "babel-plugin-transform-runtime": "^6.23.0",
  "babel-preset-es2015": "^6.24.1",
  "babel-preset-stage-3": "^6.24.1"
}
```

This approach can be used to create multiple node.js service base images
with different set of dependencies organized by service roles,
i.e. queue workers, external apis, data access layers etc.
