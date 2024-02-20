const express = require('express');
const helmet = require('helmet'); // import helmet lib
const app = express();
app.use(helmet.hidePoweredBy());   // in case the known vulnerabilities in Express/Node
app.use(helmet.frameguard({ action: 'deny' })); // in case clickjacking attack
app.use(helmet.xssFilter({}));    // in case Cross-site scripting attack
app.use(helmet.noSniff());        // in case sniffing
app.use(helmet.ieNoOpen());       // set IE do NOT open the downloaded HTML

var timeInSec = 90 * 24 * 60 * 60;
app.use(helmet.hsts({ maxAge: timeInSec, force: true })); // in case protocol downgrade attacks and cookie hijacking

app.use(helmet.dnsPrefetchControl()); // disable DNS prefetching, at the cost of a performance penalty

























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
