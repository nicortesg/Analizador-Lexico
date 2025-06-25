package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
f=[;]+
%{
    public String lexeme;
%}
%%
int |
if |
else |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"=" {return Igual;}
"+" {return Suma;}
"-" {return Resta;}
"*" {return Multiplicacion;}
"/" {return Division;}

// Palabras clave
"si" { return Si; }
"entonces" { return Entonces; }
"sino" { return Sino; }
"mientras" { return Mientras; }
"para" { return Para; }
"hacer" { return Hacer; }
"var" { return Var; }
"mostrar" { return Mostrar; }
"leer" { return Leer; }
"retornar"               { return Retornar; }
"romper"                 { return Romper; }
"continuar"              { return Continuar; }

// Tipos de datos
"ent"                    { return Ent; }
"dec"                    { return Dec; }
"car"                    { return Car; }
"pal"                    { return Pal; }
"bool"                   { return Bool; }

// Constantes booleanas
"verdadero"              { return Verdadero; }
"falso"                  { return Falso; }

// Funciones nativas estadísticas
"friedman_test"          { return Friedman_test; }
"contar_rachas"          { return Contar_rachas; }
"estadistico_rachas"     { return Estadistico_rachas; }

// Funciones nativas normales
"sumatoria"              { return Sumatoria; }
"multiplicatoria"        { return Multiplicatoria; }
"raiz"                   { return Raiz; }
"potencia"               { return Potencia; }

//Delimitadores
"("     { return AgrupInicio; }
")"     { return AgrupCierre; }
"["     { return IndexApertura; }
"]"     { return IndexCierre; }
","     { return Separador; }
":"     { return DosPuntos; }
";"     { return Terminador; }



{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
