//---------------------------------------------------------------------------------
//******************************** PARCIAL 1 **************************************
//---------------------------------------------------------------------------------

/*
 * Creado por: Jonathan Mora Colodrero - Constanza Gigli
 * Fecha: 23/05/23
 * Materia: Técnicas de Compilación
 */
 
 
/*
    Consigna:
    Dado un archivo de entrada en lenguaje C, se debe generar como salida el Árbol Sintáctico (ANTLR) correcto. 
    Para lograr esto se debe construir un parser que tenga como mínimo la implementación de los siguientes puntos:
        - Reconocimiento de un bloque de código, que puede estar en cualquier parte del código fuente, controlando balance de llaves.
        - Verificación de :
            # declaraciones y asignaciones, 
            # operaciones aritmético/lógicas, 
            # declaración/llamada a función.

        - Verificación de las estructuras de control if, for y while. 
    Ante el primer error léxico o sintáctico el programa deberá terminar.
*/

grammar TP1;

// Lista de TOKENS

// Caracteres especiales
WS: [ \n\t\r] -> skip;


//TOKENS de palabras reservadas de tipos
INT: 'int';
DOUBLE: 'double';
CHAR: 'char';
VOID: 'void';


// TOKENS de palabras reservadas 
IF : 'if';
ELSE : 'else';
RETURN: 'return';
TRUE: 'true';
FALSE: 'false';


// TOKENS de palabras reservadas de ciclos
WHILE : 'while';
FOR : 'for';


// TOKENS de simbolos de puntuacion
PYC: ';';
COMA: ',';


//TOKENS de Simbolos
PA: '('; 
PC: ')'; 

LLA: '{'; 
LLC: '}'; 
 
CA: '['; 
CC: ']'; 

// TOKENS de Asignaciones
ASSIGN: '=';

// TOKENS de Operaciones Aritmeticas
SUMA: '+';
RESTA: '-';
DIV: '/';
MULT: '*';
MOD: '%';
INCREMENTO: '++';
DECREMENTO: '--';
PREG: '?';
          
// TOKENS de Operaciones Logicas
OR : '||';
AND : '&&';
NOT : '!';

// TOKENS de operaciones relacionales
COMPARADOR: '==' | '!=' | '>' | '>=' | '<' | '<=';

//TOKENS de valores
fragment DIGITO: [0-9];

//Entero
NUMERO: (DIGITO)+;

//Flotante
FLOATNUMBER: NUMERO '.' | NUMERO '.' NUMERO | '.' NUMERO;

fragment LETRA : [a-zA-Z] ;
ID : ('_' | LETRA) ('_' | LETRA | DIGITO)*;

CHARVALUE: '\'' LETRA '\'';



//Lista de reglas gramaticales
programa: instructions
       |
       ;

instructions: instructions intr 
            | intr
            ;

intr: varDeclaration
    | funcDeclaration
    ;

//Declaracion de variables
varDeclaration: especificarType listaVarDecl PYC;

listaVarDecl: listaVarDecl COMA varDeclIni
            | varDeclIni
            ;

//Inicializacion de variables
varDeclIni: varId
          | expresion
          ;

varId: ID;

//Tipos de variables
especificarType: INT | DOUBLE | CHAR;

//Tipos de returns
returnEspecificarType: INT | DOUBLE | CHAR | VOID;


//Declaracion de funcion
funcDeclaration: returnEspecificarType ID PA listaParam PC declaracion
               | ID PA listaParam PC declaracion
               ;

listaParam: especificarType varId listaParam
          | COMA especificarType varId listaParam
          |
          ;

declaracion: declararEspecifica | bloqueInst | selectionDecla | iterationDecla | returnDecla | intr;

//Bloque de instrucciones
bloqueInst: LLA listaDecla LLC;

listaDecla: declaracion listaDecla
          | 
          ;

declararEspecifica: expresion PYC
                   | PYC
                   ;

//Seleccion
selectionDecla: IF PA expresionSimple PC declaracion
              | IF PA expresionSimple PC declaracion ELSE declaracion
              ;

//Ciclos
iterationDecla: whileDecla
              | forDecla
              ;
//While
whileDecla: WHILE PA expresionSimple PC declaracion;

//For
forDecla: FOR PA forDefinicion PC declaracion;
forDefinicion: forInit PYC expresionSimple PYC expresion;
forInit: especificarType listaVarDecl;

//Return
returnDecla: RETURN PYC
           | RETURN expresion PYC
           ;


expresion : varId ASSIGN expresion 
          | varId INCREMENTO 
          | varId DECREMENTO 
          | expresionSimple
          ;

expresionSimple: expresionSimple OR andExpression
               | andExpression
               ;

andExpression: andExpression AND expresionRelUnitaria
             | expresionRelUnitaria
             ;

expresionRelUnitaria: NOT expresionRelUnitaria
                    | expresionRel
                    ;

expresionRel: sumaExpresion COMPARADOR sumaExpresion
            | sumaExpresion
            ;

// Suma Aritmetica
sumaExpresion: sumaExpresion operadorSumaAritm term
             | term
             ;

// Operadores de suma aritmetica
operadorSumaAritm: SUMA | RESTA ;

// Multiplicacion aritmetica
term: term operadorMultiAritm expresionUnitaria
    | expresionUnitaria
    ;

// Operadores de multiplicacion aritmetica
operadorMultiAritm: MULT | DIV | MOD;

// Operacion unaria
expresionUnitaria: operadorUnitaria expresionUnitaria
                 | factor
                 ;

// Operadores unarios
operadorUnitaria: RESTA | MULT | PREG ;

factor: value 
      | varId;

value: PA expresion PC 
     | call
     | resValue
     ;

// Llamada a funcion
call: varId PA argumento PC;

// Argumentos de funcion
argumento: listaArgumento
         |
         ;
// Lista de argumentos de funcion
listaArgumento: listaArgumento COMA expresion
              | expresion
              ;

// Valores posibles
resValue: NUMERO 
        | FLOATNUMBER 
        | CHARVALUE
        | TRUE
        | FALSE
        ;
