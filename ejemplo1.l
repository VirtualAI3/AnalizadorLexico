%option noyywrap
%{   
 /*LT, LE, EQ, NE, GT, GE, ID, NUMERO, SIGNO, OPREL, SELECT, FROM, WHERE*/
%}
delim [ \t\n]
ws {delim}+
letra [A-Za-z]
digito [0-9]
id ({letra}|_)({letra}|{digito}|_)*
numero {digito}+(\.{digito}+)?(E[+−]?{digito}+)?
select [Ss][Ee][Ll][Ee][Cc][Tt]
from [Ff][Rr][Oo][Mm]
where [Ww][Hh][Ee][Rr][Ee]
%%
{ws} {} // Ignorar espacios en blanco
{select} { printf("PC: %s\n",yytext);}
{from} { printf("PC: %s\n",yytext);}
{where} { printf("PC: %s\n",yytext);}
"<" { printf("OPREL: <\n");}
"<=" { printf("OPREL: <=\n");}
"=" { printf("OPREL: =\n");}
"<>" { printf("OPREL: <>\n");}
">" { printf("OPREL: >\n");}
">=" { printf("OPREL: >=\n");}
"," { printf("SIGNO: ,\n");}
{id} { 
    printf("ID: %s\n", yytext);
    // Aquí puedes realizar acciones adicionales si es necesario
}
{numero} { 
    printf("Numero: %s\n", yytext);
    // Aquí puedes realizar acciones adicionales si es necesario
}
[0-9]+([A-Za-z_])* {
    printf("Token desconocido: %s\n", yytext);
}
. { printf("Token desconocido: %s\n", yytext); /* Manejar otros caracteres no reconocidos */ }
%%
int instalarID(){
    /*Funcion para instalar el lexema en la tabla de simbolos 
    y devolver un apuntador a esto; yytext apunta al primer
    caracter y yylent es la longitud
    */
}
int instalarNum(){
    /*Similar a instalarID, pero coloca las
    constantes numericas en una tabla separada*/
}
int main()
{
    yyin = fopen("texto.txt", "r");
    yylex();
    fclose(yyin);
    return 0;
}
