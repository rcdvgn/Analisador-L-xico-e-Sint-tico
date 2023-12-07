grammar JavaScript;

IF: 'if';
ELSE: 'else';
WHILE: 'while';
FUNCTION: 'function';
LET: 'let';
VAR: 'var';
CONST: 'const';
RETURN: 'return';
LOG: 'console.log';

ID: (LET | VAR | CONST | RETURN)? [a-zA-Z_][a-zA-Z0-9_]*;
INT: [0-9]+;
FLOAT: [0-9]+'.'[0-9]+;
STRING: '"' (~[\r\n"] | '""')* '"';
VARIABLE: INT | FLOAT | STRING;
NEWLINE: '\r'? '\n' -> skip;
WS: [ \t]+ -> skip;

EQUALS: '=';
COMPARISON: '==';
STRICT_COMPARISON: '===';
PLUS: '+';
MINUS: '-';
GREATER_THAN: '>';
LESS_THAN: '<';
LESS_OR_EQUAL_TO: '<'(EQUALS | COMPARISON);
GREATER_OR_EQUAL_TO: '>'(EQUALS | COMPARISON);
NOT_EQUAL: '!=';
NOT_EQUAL_STRICT: '!==';
MULT: '*';
DIV: '/';
LPAREN: '(';
RPAREN: ')';
COMMA: ',';
LBRACE: '{';
RBRACE: '}';
SEMICOLON: ';' -> skip;

LINE_COMMENT: '//' ~[\r\n]* -> skip;
BLOCK_COMMENT: '/*' .*? '*/' -> skip;

AND: '&&';
OR: '||';

program: statement+;

statement: variableInitialization
         | variableDeclaration
         | equation
         | functionDeclaration
         | conditionalStatement
         | loopStatement
         | returnStatement
         | logStatement
         ;

variableInitialization: (LET | VAR | CONST) ID (EQUALS expression)?;

variableDeclaration: ID EQUALS expression;

equation: VARIABLE EQUALS expression;

functionDeclaration: FUNCTION ID LPAREN parameters? RPAREN LBRACE statement+ RBRACE;

parameters: ID (COMMA ID)*;

conditionalStatement: IF LPAREN expression RPAREN LBRACE statement+ RBRACE (ELSE LBRACE statement+ RBRACE)?;

loopStatement: WHILE LPAREN expression RPAREN LBRACE statement+ RBRACE;

returnStatement: RETURN expression;

logStatement: LOG LPAREN expression (COMMA expression)* RPAREN;

expression: logicalExpression;

logicalExpression: relationalExpression ((AND | OR) relationalExpression)*;

relationalExpression: additiveExpression ((EQUALS | COMPARISON | STRICT_COMPARISON | GREATER_THAN | LESS_THAN | LESS_OR_EQUAL_TO | GREATER_OR_EQUAL_TO | NOT_EQUAL | NOT_EQUAL_STRICT) additiveExpression)?;

additiveExpression: multiplicativeExpression ((PLUS | MINUS) multiplicativeExpression)*;

multiplicativeExpression: primaryExpression ((MULT | DIV) primaryExpression)*;

primaryExpression: INT | FLOAT | STRING | ID | LPAREN expression RPAREN;
