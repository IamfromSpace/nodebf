%lex
%%

[^+\-><\[\]\.\,]+   /* skip invalid */
">"                 return '>'
"<"                 return '<'
"-"                 return '-'
"+"                 return '+'
"["                 return '['
"]"                 return ']'
"."                 return '.'
","                 return ','
<<EOF>>             return 'EOF'

/lex

%start expressions
%%

expressions
   : e EOF
      {return 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s?s.split(\'\'):[];cp=0;o=\'\';' + $1 + 'd=null;return o;}';}
   ;

e
   : e symbol
      {$$ = $1 + $2;}
   | e '[' e ']'
      {$$ = $1 + 'while(d[p]) {' + $3 + '}';}
   | '[' e ']' //Loops that begin programs will never execute, so we ignore them
      {$$ = '';}
   | symbol
      {$$ = $1;}
   ;

symbol
   : '.'
      {$$ = 'o+=String.fromCharCode(d[p]);';}
   | ','
      {$$ = 'd[p]=c[cp]?String.charCodeAt(c[cp]):0;cp++;';}
   | '+'
      {$$ = 'd[p]++;';}
   | '-'
      {$$ = 'd[p]--;';}
   | '>'
      {$$ = 'p++;';}
   | '<'
      {$$ = 'p--;';}
   ;
