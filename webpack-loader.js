var nodebf = require('./nodebf');

module.exports = function(source) {
  this.cacheable();
  return nodebf.parser.parse(source);
}
