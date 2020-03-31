package Analizador;
import static Analizador.Tokens.*;
%%
%class Lexico
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexemas;
%}
%%
(int) {lexemas=yytext(); return Int;}
/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexemas=yytext(); return Comillas;}

/* Tipos de datos */
( byte | int | char | long | float | double ) {lexemas=yytext(); return T_dato;}

/* Tipo de dato String */
( String ) {lexemas=yytext(); return Cadena;}

/* Palabra reservada If */
( if ) {lexemas=yytext(); return If;}

/* Palabra reservada Else */
( else ) {lexemas=yytext(); return Else;}

/* Palabra reservada Switch */
( switch ) {lexemas=yytext(); return Switch;}

/* Palabra reservada Case */
( case ) {lexemas=yytext(); return Case;}

/* Palabra reservada Break  */
( break ) {lexemas=yytext(); return Break ;}

/* Palabra reservada Default */
( default ) {lexemas=yytext(); return Default;}

/* Palabra reservada Do */
( do ) {lexemas=yytext(); return Do;}

/* Palabra reservada While */
( while ) {lexemas=yytext(); return While;}

/* Palabra reservada For */
( for ) {lexemas=yytext(); return For;}

/* Operador Igual */
( "=" ) {lexemas=yytext(); return Igual;}

/* Operador Suma */
( "+" ) {lexemas=yytext(); return Suma;}

/* Operador Resta */
( "-" ) {lexemas=yytext(); return Resta;}

/* Operador Multiplicacion */
( "*" ) {lexemas=yytext(); return Multiplicacion;}

/* Operador Division */
( "/" ) {lexemas=yytext(); return Division;}

/* Palabra reservada Include */
( include ) {lexemas=yytext(); return Include;}

/* Palabra reservada Iostream */
( iostream ) {lexemas=yytext(); return Include;}

/* Palabra reservada Using */
( using ) {lexemas=yytext(); return Using;}

/* Palabra reservada Namespace */
( namespace ) {lexemas=yytext(); return Namespace;}

/* Palabra reservada Std*/
( std ) {lexemas=yytext(); return Std;}

/* Palabra reservada Cin*/
( cin ) {lexemas=yytext(); return Cin;}

/* Palabra reservada Cout*/
( cout ) {lexemas=yytext(); return Cout;}

/* Palabra reservada Scanf*/
( scanf ) {lexemas=yytext(); return Scanf;}

/* Palabra reservada Printf*/
( printf ) {lexemas=yytext(); return Printf;}

/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {lexemas=yytext(); return Op_logico;}

/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexemas = yytext(); return Op_relacional;}

/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" ) {lexemas = yytext(); return Op_atribucion;}

/* Operadores Incremento y decremento */
( "++" | "--" ) {lexemas = yytext(); return Op_incremento;}

/*Operadores Booleanos*/
(true | false)      {lexemas = yytext(); return Op_booleano;}

/* Parentesis de apertura */
( "(" ) {lexemas=yytext(); return Parentesis_a;}

/* Parentesis de cierre */
( ")" ) {lexemas=yytext(); return Parentesis_c;}

/* Llave de apertura */
( "[" ) {lexemas=yytext(); return Llave_a;}

/* Llave de cierre */
( "]" ) {lexemas=yytext(); return Llave_c;}

/* Corchete de apertura */
( "{" ) {lexemas=yytext(); return Corchete_a;}

/* Corchete de cierre */
( "}" ) {lexemas=yytext(); return Corchete_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexemas=yytext(); return Main;}

/* Dos puntos */
( ":" ) {lexemas=yytext(); return Dos_puntos;}

/* Punto y coma */
( ";" ) {lexemas=yytext(); return P_coma;}

/* Coma */
( "," ) {lexemas=yytext(); return Coma;}

/* Punto */
( "." ) {lexemas=yytext(); return Punto;}

/* Identificador */
{L}({L}|{D})* {lexemas=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexemas=yytext(); return Numero;}

/* Error de analisis */
 . {return ERROR;}

