#Node.bf

###It's as easy as +>++>+++!

Dust off all those super helpful 8 character libraries, you can now use them in Node!

Node.bf is a javascript transpiler that compiles node modules from [BrainFuck](https://en.wikipedia.org/wiki/Brainfuck), a Turing complete lanuage that uses only the characters `+-><[].,`  The lanugage is notiriously difficult to use, and is generally done so as a programming puzzle.

###Using a Node.bf Module

When compiled, the resulting js file will export a single function than accepts a string as input and returns a new string based on the program execution.

###Development

Node.bf is developed using Jison, a javascript port of Bison/Flex.  To create the parser based on the grammar in the jison file, just run `npm run build`.

####Running Tests

Tests are currently run via Karma/Mocha/Webpack.  `.bf` files can be imported directly in tests Karma-based, and they are compiled and injected via Webpack/the custom loaders in this project.  To execute tests, run `npm test`.
