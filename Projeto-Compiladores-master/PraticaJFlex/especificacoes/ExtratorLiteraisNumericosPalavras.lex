
package com.br.praticasjflex.extratorliteraisinteirospalavras;

%%  

%class IdentificadorLiteraisNumericosePalavras
%type Token
%line
%column 
 
DIGITO = [0-9] 
LITERALNUMERICO = {DIGITO}+
LETRA = [A-Za-z]
IDENTIFICADORES = ( {LETRA} | \_ )( {LETRA} | {DIGITO} | \_ )*
InputCharacter = [^\r\n]

NOVALINHA = \n | \r\n | \t\n  | \r | \t
ESPACO = [ ]

LITERAISPONTOFLUTUANTE = {DIGITO}+ "." {DIGITO}* | {DIGITO}* "." {DIGITO}+

SIMBOLOSPONTUACAO = \: | \; | \, | \. | \( | \) | \{ | \} |\# | \&

OPERADORESCOMPARACAO = \== | \!= | \< | \> | \<= | \>=
OPERADORESLOGICOS = \&& | \|\|
OPERADORESARITMETICOS = (\+ | \- | \* | \/)
OPERADORATRIBUICAO = (\=)
OPERADORES = {OPERADORESCOMPARACAO} | {OPERADORESLOGICOS} | {OPERADORESARITMETICOS} | {OPERADORATRIBUICAO}

LITERALCHAR = \'({LETRA} | \\n | \\r | \\t)+\'
LITERALSTRING = \"(([ ] | {LETRA} | {OPERADORES} | {SIMBOLOSPONTUACAO} | {DIGITO} | \\n | \\r | \\t)*)\"

COMENTARIO = {COMENTARIOTRADICIONAL} | {COMENTARIOLINHA} | {COMENTARIODOCUMENTACAO}
COMENTARIOTRADICIONAL = "/*" [^*] ~"*/" | "*/" "*"+ "/"
COMENTARIOLINHA = "//" {InputCharacter}* {NOVALINHA}?
COMENTARIODOCUMENTACAO = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*

%% 
"char"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"int"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"float"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"double"					{ return new Token("PR", yyline, yycolumn, yytext()); }

"while"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"for"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"if"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"else"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"do"						{ return new Token("PR", yyline, yycolumn, yytext()); }

"static"					{ return new Token("PR", yyline, yycolumn, yytext()); }
"void"						{ return new Token("PR", yyline, yycolumn, yytext()); }
"return"					{ return new Token("PR", yyline, yycolumn, yytext()); }
"include"					{ return new Token("PR", yyline, yycolumn, yytext()); }
"main"						{ return new Token("PR", yyline, yycolumn, yytext()); }

"printf"					{ return new Token("PR", yyline, yycolumn, yytext()); }
"printint"					{ return new Token("PR", yyline, yycolumn, yytext()); }
"printstr"					{ return new Token("PR", yyline, yycolumn, yytext()); }

{LITERALNUMERICO}       	{ return new Token("LI", yyline, yycolumn, yytext()); }
{IDENTIFICADORES} 			{ return new Token("ID", yyline, yycolumn, yytext()); }
{LITERAISPONTOFLUTUANTE}	{ return new Token("FLOAT", yyline, yycolumn, yytext()); }
{OPERADORES}				{ return new Token("OP", yyline, yycolumn, yytext()); }     
{SIMBOLOSPONTUACAO}			{ return new Token("SP", yyline, yycolumn, yytext()); }
{LITERALCHAR}				{ return new Token("LC", yyline, yycolumn, yytext()); }
{LITERALSTRING}     		{ return new Token("LS", yyline, yycolumn, yytext()); }
{COMENTARIO} 				{/* ignore */}
{NOVALINHA} 				{}
{ESPACO}					{/* ignore */}
. 						 	{System.out.printf("error: unexpected char |%s|\n",yytext());}