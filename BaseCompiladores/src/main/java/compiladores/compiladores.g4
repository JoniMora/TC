grammar compiladores; ///-> Analizador lexico y gramatical
//lexer -> Analisis lexico

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

NUMERO : DIGITO+ ;
// OTRO : . ;

//Regla para los espacios en blanco
WS : [ \n\t\r] -> skip;

ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

PA : '(';
PC : ')';
LA : '{';
LC : '}';
CA : '[';
CC : ']';

// si : s EOF;

// s : PA s PC s
//   |
//   ;

// s : ID     { System.out.println("ID ->" + $ID.getText() + "<--"); }         s
//   | NUMERO { System.out.println("NUMERO ->" + $NUMERO.getText() + "<--"); } s
//   | OTRO   { System.out.println("Otro ->" + $OTRO.getText() + "<--"); }     s
//   | EOF
//   ;

s : PA s PC
  | CA s CC
  | LA s LC
  |
  ;