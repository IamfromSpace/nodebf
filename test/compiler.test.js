var helloWorld = require('./fixtures/helloworld.bf');
var helloWorldWithCommentLoop = require('./fixtures/helloworldWithCommentLoop.bf');


describe('Compiler', function() {
  it('should compile helloworld.bf correctly', function() {
    var result = helloWorld();
    if (result !== 'Hello World!\n') {
      throw new Error('didn\'t match! Got: ' + result);
    }
  });

  it('should compile files with comment loops correctly', function() {
    var result = helloWorld();
    if (result !== 'Hello World!\n') {
      throw new Error('didn\'t match! Got: ' + result);
    }
  });
});
