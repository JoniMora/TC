grammar compiladores; ///-> Analizador lexico y gramatical
//lexer -> Analisis lexico

// lexico recursivo

//-> Directiva para hacer algo en la cabezera de los archivos generados - Comentar para depurar y descomentar para correr el codigo
@header { 
package compiladores;
}

fragment LETRA : [A-Za-z]; //-> fragment es solo para uso interno (No produce token)
fragment DIGITO : [0-9];

//OPERATOR : [-+*/%];
//ERROR1 : ["HOLA""CHAU"]; No usar!!
//ERROR2 : [17-34]; Mal --> "1"[789] | "2"[0-9] | "3"[0-4];
//COMPLEMENTO : ~[AEIOU]; -> Todo menos esto

// OTRO : . ;

//Regla para los espacios en blanco
WS : [ \n\t\r] -> skip;

// PA : '(';
// PC : ')';
// LA : '{';
// LC : '}';
// PYC : ';';
// IGUAL : '=';

// INT : 'int';

// NUMERO : DIGITO+ ;
// ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

// si : s EOF;

// s : PA s PC s
//   |
//   ;

// s : ID     { System.out.println("ID ->" + $ID.getText() + "<--"); }         s
//   | NUMERO { System.out.println("NUMERO ->" + $NUMERO.getText() + "<--"); } s
//   | OTRO   { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }     s
//   | EOF
//   ;

//------------- Balance de llaves ------------------//

// PA : '(';
// PC : ')';
// LA : '{';
// LC : '}';
// CA : '[';
// CC : ']';

// s : PA s PC
//   | CA s CC
//   | LA s LC
//   |
//   ;

//------------- Expresiones regulares ------------------//

// fragment YEAR : DIGITO DIGITO DIGITO DIGITO ;

// // Definir una Expresión Regular para capturar fechas correspondientes a los meses pares (formato DD/MM/YYYY).
// EVEN_DATE : ( '0'[1-9] | [12][0-9] | '3'[01] ) '/' ( '0' [2468] | '1'[02] ) '/' YEAR
//             {System.out.print("EVEN DATE " + getText() + " ");};

// // Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 08:00 y las 12:59 (formato HH:MM).
// AM_TIME : ( '0'[89] | '1'[0-2] ) ':' [0-5][0-9]
//           {System.out.println("AM TIME: " + getText() + " ");};

// //Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 18:30 y las 21:30 (formato HH:MM).
// PM_TIME : ( '18' ':' [3-5][0-9] | '19' ':' [0-5][0-9] | '20' ':' [0-5][0-9] | '21' ':' [0-2][0-9] | '21:30')
//           {System.out.println("PM TIME: " + getText() + " ");};

// OTRO : .+? ;
// start : ( date | am | pm | otro )* EOF;

// date : EVEN_DATE;
// am : AM_TIME;
// pm : PM_TIME;
// otro : OTRO;

// programa : instrucciones EOF;

// instrucciones : instruccion instrucciones
//                |
//                ;

// instruccion : LA instrucciones LC
//             | declaracion
//             | assignacion
//             ;

// declaracion : INT ID PYC;
// assignacion : ID IGUAL NUMERO PYC;


//------------- Analisis Sintactico - Reglas simples ------------------//
// Realizar el archivo .g4 con las expresiones regulares y reglas sintácticas que contemple las siguientes instrucciones:
// declaracion -> int x;
//                double y;
//                int z = 0;
//                double w, q, t;
//                int a = 5, b, c = 10;

// asignacion -> x = 1;
//               z = y;

// iwhile -> while (x comp y) { instrucciones }

// //Tokens
// PA : '(';
// PC : ')';
// LA : '{';
// LC : '}';
// PYC : ';';
// IGUAL : '=';
// COMA: ',';
// OP_COMP : '<' | '>' | '<=' | '>=' | '==' | '!=';
// OP_ARIT : '+' | '-' | '*' | '/';


// //Reserved words
// INT : 'int';
// DOUBLE : 'double';
// WHILE: 'while';

// NUMERO : DIGITO+ ;
// ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;


// programa : instrucciones EOF;

// instrucciones : instruccion PYC instrucciones 
//               | 
//               ;

// instruccion : declaracion 
//             | asignacion 
//             | iwhile
//             ;

// declaracion : tipo variableDeclarada (COMA variableDeclarada)*;

// asignacion : ID IGUAL expresion;

// iwhile : WHILE PA expresion PC LA instrucciones LC;

// tipo : INT | DOUBLE;

// variableDeclarada : ID (IGUAL NUMERO)?;

// expresion : termino (OP_ARIT termino)*;

// termino : factor (OP_COMP factor)?;

// factor : ID | NUMERO;



PA : '(';
PC : ')';
LA : '{';
LC : '}';
PYC : ';';
IGUAL : '=';
SUMA: '+';
RESTA: '-';
MULT: '*';
DIV: '/';
MOD: '%';
COMA: ',';
OP_COMP : '<' | '>' | '<=' | '>=' | '==' | '!=';
OP_ARIT : '+' | '-' | '*' | '/';

INT : 'int';
DOUBLE : 'double';
WHILE: 'while';

NUMERO : DIGITO+ ;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

programa : instrucciones EOF;

instrucciones : instruccion instrucciones 
              | 
              ;

instruccion : LA instrucciones LC
            | declaracion 
            | asignacion
            ;

declaracion : INT ID PYC;

asignacion: ID IGUAL exp PYC;

expresiones: exp PYC expresiones 
           | EOF
           ;

exp: e;

e: term t;

term: factor f;

t: SUMA term t
 | RESTA term t
 |
 ;

factor: NUMERO
      | ID
      | PA exp PC
      ;

f: MULT factor f
 | DIV factor f
 | MOD factor f