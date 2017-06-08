package br.com.munif.ooweb;

public class Jogador extends Personagem {

    public Jogador() {
    }

    public Jogador(String nome, Lugar lugar) {
        super(nome, lugar);
    }

    public String getNome() {
        return nome;
    }

}
