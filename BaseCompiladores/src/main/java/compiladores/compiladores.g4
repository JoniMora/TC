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

// OTRO : . ;

//Regla para los espacios en blanco
WS : [ \n\t\r] -> skip;

PA : '(';
PC : ')';
LA : '{';
LC : '}';
PYC : ';';
IGUAL : '=';

INT : 'int';

NUMERO : DIGITO+ ;
ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

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

programa : instrucciones EOF;

instrucciones : instruccion instrucciones
               |
               ;

instruccion : LA instrucciones LC
            | declaracion
            | assignacion
            ;

declaracion : INT ID PYC;
assignacion : ID IGUAL NUMERO PYC;