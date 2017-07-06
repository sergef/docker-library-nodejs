# Docker base images

## Generic Node.js base image

Not wasting time to configure, develop, build and install new Node.js servces.

All services can re-use pre-defined set of npm packages already installed
from the base image:

```json
"dependencies": {
  "async": "^2.5.0",
  "aws-sdk": "^2.81.0",
  "bluebird": "^3.5.0",
  "body-parser": "^1.17.2",
  "chrome-remote-interface": "^0.23.3",
  "config": "^1.26.1",
  "cookie-parser": "^1.4.3",
  "express": "^4.15.3",
  "express-paginate": "^0.2.2",
  "fluent-ffmpeg": "^2.1.2",
  "fs-extra": "^3.0.1",
  "http-status-codes": "1.1.6",
  "js-yaml": "^3.8.4",
  "jsonwebtoken": "^7.4.1",
  "kue": "0.11.6",
  "lodash": "^4.17.4",
  "mime-types": "^2.1.15",
  "moment": "^2.18.1",
  "mongoose": "^4.11.1",
  "mongoose-paginate": "^5.0.3",
  "node-cleanup": "^2.1.2",
  "response-time": "^2.3.2",
  "swagger-client": "^3.0.16",
  "swagger-mongoose": "^1.1.2",
  "swagger-node-runner": "^0.7.3",
  "validator": "^7.2.0"
},
"devDependencies": {
  "babel-cli": "^6.24.1",
  "babel-preset-es2015": "^6.24.1",
  "babel-preset-stage-3": "^6.24.1"
}
```

Approach can be used to create multiple Node.js service base images
with different set of dependencies organized by service roles,
i.e. queue workers, external apis, data access layers etc.
