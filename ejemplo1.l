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
. { printf("Token desconocido: %s\n", yytext); /* Manejar otros caracteres no reconocidos */ }
%%
int main()
{
    yyin = fopen("texto.txt", "r");
    yylex();
    fclose(yyin);
    return 0;
}
