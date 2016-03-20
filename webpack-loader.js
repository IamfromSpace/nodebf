var bfjs = require('./bfjs');

module.exports = function(source) {
  this.cacheable();
  return bfjs.parser.parse(source);
}
