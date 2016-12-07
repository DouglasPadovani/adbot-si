/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO_Objects;

public class Click_logDTO {

    private String Nome_cliente;
    private String Idade_cliente;
    private String IP_cliente;
    private String Genero_cliente;
    private float Gasto_click;
    

    // Construtor (para incluí-lo, clique com o botão direito > Insert Code ... > Constructor)
    public Click_logDTO() {
    }

    // Setters (para incluí-los, clique com o botão direito > Insert Code ... > Setters)
    public void setNome_cliente(String Nome_cliente) {
        this.Nome_cliente = Nome_cliente;
    }

    public void setIdade_cliente(String Idade_cliente){
        this.Idade_cliente = Idade_cliente;
    }
    
    public void setIP_cliente(String IP_cliente){
        this.IP_cliente = IP_cliente;
    }
    
    public void setGenero_cliente(String Genero_cliente){
        this.Genero_cliente = Genero_cliente;
    }
    
    public void setGasto_click(float Gasto_click){
        this.Gasto_click = Gasto_click;
    }
    

    // Getters (para incluí-los, clique com o botão direito > Insert Code ... > Getters)
    public String getNome_cliente() {
        return Nome_cliente;
    }
    
    public String getIdade_cliente() {
        return Idade_cliente;
    }
    
    public String getIP_cliente() {
        return IP_cliente;
    }
    
    public String getGenero_cliente() {
        return Genero_cliente;
    }
    
    public float getGasto_click() {
        return Gasto_click;
    }

}