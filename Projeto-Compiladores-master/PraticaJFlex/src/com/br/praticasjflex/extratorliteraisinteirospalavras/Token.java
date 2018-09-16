package com.br.praticasjflex.extratorliteraisinteirospalavras;

public class Token {

	// Atributos

	private String tipo;

	private String lexema;

	private int linha;

	private int coluna;

	// Construtor

	public Token(String tipo, int linha, int coluna, String lexema) {

		this.tipo = tipo;
		this.linha = linha;
		this.coluna = coluna;
		this.lexema = lexema;

	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public String getLexema() {
		return lexema;
	}

	public void setLexema(String lexema) {
		this.lexema = lexema;
	}

	public int getLinha() {
		return linha;
	}

	public void setLinha(int linha) {
		this.linha = linha;
	}

	public int getColuna() {
		return coluna;
	}

	public void setColuna(int coluna) {
		this.coluna = coluna;
	}
	
	public String toString() {
		return "<" + this.getTipo() + ", " + this.getLexema() + ", " + 
				this.getLinha() + ", " + this.getColuna() + ">";
	}

}
