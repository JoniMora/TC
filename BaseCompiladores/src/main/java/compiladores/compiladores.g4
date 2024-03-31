grammar compiladores; ///-> Analizador lexico y gramatical
//lexer -> Analisis lexico

//-> Directiva para hacer algo en la cabezera de los archivos generados - Comentar para depurar y descomentar para correr el codigo
@header { 
package compiladores;
}

fragment LETRA : [A-Za-z]; //-> fragment es solo para uso interno (No produce token)
//fragment DIGITO : [0-9];

//OPERATOR : [-+*/%];
//ERROR1 : ["HOLA""CHAU"]; No usar!!
//ERROR2 : [17-34]; Mal --> "1"[789] | "2"[0-9] | "3"[0-4];
//COMPLEMENTO : ~[AEIOU]; -> Todo menos esto

NUMERO : DIGITO+ ;
// OTRO : . ;

//Regla para los espacios en blanco
WS : [ \n\t\r] -> skip;

ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

// PA : '(';
// PC : ')';

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

// Definir una Expresión Regular para capturar fechas correspondientes a los meses pares (formato DD/MM/YYYY).
// DATE : ( '0' [1-9] | [12][0-9] | '3'[0-1] ) SEPARATOR ( '0' [2468] | '10' | '12' ) SEPARATOR DIGITO DIGITO DIGITO DIGITO; //D0-31 / M-Par / Y
// SEPARATOR: ('-' | '/');
// DIGITO: [0-9];

// s : DATE s
//   |
//   ;


// Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 08:00 y las 12:59 (formato HH:MM).
// TIME: ('0' [89] | '1' [0-2]) SEPARATOR ([0-5][0-9]);
// SEPARATOR: (':');
// DIGITO: [0-9];

// s : TIME s
//   |
//   ;


//Definir una Expresión Regular para capturar horas correspondientes a las horas entre las 18:30 y las 21:30 (formato HH:MM).
TIME: ('18' SEPARATOR ([3-5][0-9]) | '19' SEPARATOR ([0-5][0-9]) | '20' SEPARATOR ([0-5][0-9]) | '21' SEPARATOR ([0-2][0-9]));
SEPARATOR: (':');
DIGITO: [0-9];

s : TIME s
  |
  ;