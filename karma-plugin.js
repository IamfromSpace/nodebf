var nodebf = require('./nodebf.js');

var createNodebfPreprocessor = function (args, config, logger, helper) {
  var log = logger.create('preprocessor.nodebf')
  return function (content, file, done) {
    result = null;
    try {
      result = nodebf.parser.parse(content);
    } catch (e) {
      log.error('compile error! ' + e.toString());
      return done(e);
    }
    log.debug(result);
    return done(null, result);
  }
}

module.exports = {
  'preprocessor:nodebf': ['factory', createNodebfPreprocessor]
}
