const express = require('express');
const helmet = require('helmet');   // import helmet lib
const app = express();
app.use(helmet.hidePoweredBy());    // in case the known vulnerabilities in Express/Node
app.use(helmet.frameguard({ action: 'deny' })); // in case clickjacking attack

























module.exports = app;
const api = require('./server.js');
app.use(express.static('public'));
app.disable('strict-transport-security');
app.use('/_api', api);
app.get("/", function (request, response) {
  response.sendFile(__dirname + '/views/index.html');
});
let port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Your app is listening on port ${port}`);
});
