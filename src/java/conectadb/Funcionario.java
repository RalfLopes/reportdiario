/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conectadb;

/**
 *
 * @author t7249320
 */
public  class Funcionario {
    
    String nome= "";

    public Funcionario() {
    }
    String torre= "";
    String login= "";

    public String getNome() {
        return nome;
    }

    public void setNome(String funcionario) {
        this.nome = funcionario;
    }

    public String getTorre() {
        return torre;
    }

    public void setTorre(String torre) {
        this.torre = torre;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    String senha= "";
    
}
