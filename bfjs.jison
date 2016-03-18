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
      {return $1 + 'd=null;return o;}';}
   ;

e
   : e '+'
      {$$ = $1 + 'd[p]++;';}
   | e '-'
      {$$ = $1 + 'd[p]--;';}
   | e '>'
      {$$ = $1 + 'p++;';}
   | e '<'
      {$$ = $1 + 'p--;';}
   | e '['
      {$$ = $1 + 'while(d[p]) {';} 
   | e ']'
      {$$ = $1 + '}';}
   | e '.'
      {$$ = $1 + 'o+=String.fromCharCode(d[p]);';}
   | e ','
      {$$ = $1 + 'd[p]=c[cp]?String.charCodeAt(c[cp]):0;cp++;';}
   | '.'
      {$$ = 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s.split(\'\');cp=0;o=\'\';o+=String.fromCharCode(d[p]);';}
   | ','
      {$$ = 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s.split(\'\');cp=0;o=\'\';d[p]=c[cp]?String.charCodeAt(c[cp]):0;cp++;';}
   | '+'
      {$$ = 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s.split(\'\');cp=0;o=\'\';d[p]++;';}
   | '-'
      {$$ = 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s.split(\'\');cp=0;o=\'\';d[p]--;';}
   | '>'
      {$$ = 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s.split(\'\');cp=0;o=\'\';p++;';}
   | '<'
      {$$ = 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s.split(\'\');cp=0;o=\'\';p--;';}
   | '['
      {$$ = 'module.exports = function(s) {var d=new Uint8Array(30000);var p=0;c=s.split(\'\');cp=0;o=\'\';while(d[p]) {';}
   ;
