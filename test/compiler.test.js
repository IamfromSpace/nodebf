var helloWorld = require('./fixtures/helloworld.bf');


describe('Compiler', function() {
  it('should compile helloworld.bf correctly', function() {
    var result = helloWorld();
    if (result !== 'Hello World!\n') {
      throw new Error('didn\'t match! Got: ' + result);
    }
  });
});
