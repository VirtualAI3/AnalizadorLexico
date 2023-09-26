%{
#include <iostream>
using namespace std;
%}

DIGIT [0-9]

%%
{DIGIT}+   { cout << "Número entero: " << yytext << endl; }
\n         { /* Ignorar saltos de línea */ }
.          { cout << "Carácter no reconocido: " << yytext << endl; }

%%

int main() {
    yylex();
    return 0;
}
