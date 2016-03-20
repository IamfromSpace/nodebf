var bfjs = require('./bfjs.js');

var createBfjsPreprocessor = function (args, config, logger, helper) {
  var log = logger.create('preprocessor.bfjs')
  return function (content, file, done) {
    result = null;
    try {
      result = bfjs.parser.parse(content);
    } catch (e) {
      log.error('compile error! ' + e.toString());
      return done(e);
    }
    log.debug(result);
    return done(null, result);
  }
}

module.exports = {
  'preprocessor:bfjs': ['factory', createBfjsPreprocessor]
}
