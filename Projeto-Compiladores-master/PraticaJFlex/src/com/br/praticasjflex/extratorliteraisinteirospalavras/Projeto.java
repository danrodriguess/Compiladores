package com.br.praticasjflex.extratorliteraisinteirospalavras;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class Projeto {
	public static void main(String[] args) throws FileNotFoundException {
		
		FileReader file = null;
		try {
			file = new FileReader("programas/CodigoProjeto.txt");
			IdentificadorLiteraisNumericosePalavras analisador = new IdentificadorLiteraisNumericosePalavras(file);
			
			Token token = analisador.yylex();
			int qtdTokens = 0;
			while(token != null){
				System.out.println("\tToken: " + token);
				token = analisador.yylex();
				qtdTokens++;
			}
			System.out.println("Total de Tokens: "+qtdTokens);
			
		}catch(IOException io){
			io.printStackTrace();	
		}
		
		
	}
}
