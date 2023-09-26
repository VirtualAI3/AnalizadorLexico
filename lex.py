import ply.lex as lex

tabla_variables = []
keywords=['select','from','where']
tokens=keywords+['id','oprel','numero','signo']
def t_select(t):
    r'[Ss][Ee][Ll][Ee][Cc][Tt]'
    return t
def t_from(t):
    r'[Ff][Rr][Oo][Mm]'
    return t
def t_where(t):
    r'[Ww][Hh][Ee][Rr][Ee]'
    return t
def t_id(t):
    r'[a-zA-Z_][a-zA-Z0-9_]*'
    return t
def t_oprel(t):
    r'<=|>=|<>|<|>|='
    return t
def t_numero(t):
    r'\d+(\.\d+)?'
    if '.' in t.value:
        t.value = float(t.value)
    else:
        t.value = int(t.value)
    return t
def t_signo(t):
    r','
    return t
t_ignore = ' \t\n'

codigo = 'SELECT col1,col2 from mi_Tabla wHERE col1 < 20'
lexer = lex.lex(debug=True)

lexer.input(codigo)

for token in lexer:
    print(token)
