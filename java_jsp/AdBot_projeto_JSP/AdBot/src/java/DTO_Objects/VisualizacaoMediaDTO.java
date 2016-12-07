/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DTO_Objects;

import java.sql.Timestamp;

public class VisualizacaoMediaDTO {
    
    private String nome;
    private String estado;
    private String testMode;
    private String tipo_produto;
    private float dinheiro_arrecadado;
    private String endereco_REST_API_chatbot;
    private Timestamp data_de_criacao;
    private int id, total_clicks, total_visualizacoes, cpc_minimo;

    public VisualizacaoMediaDTO(){}
    
    //Getters
    public String getNome() {
        return nome;
    }

    public String getEstado() {
        return estado;
    }

    public String getTestMode() {
        return testMode;
    }

    public String getTipo_produto() {
        return tipo_produto;
    }

    public float getDinheiro_arrecadado() {
        return dinheiro_arrecadado;
    }

    public String getEndereco_REST_API_chatbot() {
        return endereco_REST_API_chatbot;
    }

    public Timestamp getData_de_criacao() {
        return data_de_criacao;
    }

    public int getId() {
        return id;
    }

    public int getTotal_clicks() {
        return total_clicks;
    }

    public int getTotal_visualizacoes() {
        return total_visualizacoes;
    }

    public int getCpc_minimo() {
        return cpc_minimo;
    }
    
    //Setters
    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setTestMode(String testMode) {
        this.testMode = testMode;
    }

    public void setTipo_produto(String tipo_produto) {
        this.tipo_produto = tipo_produto;
    }

    public void setDinheiro_arrecadado(float dinheiro_arrecadado) {
        this.dinheiro_arrecadado = dinheiro_arrecadado;
    }

    public void setEndereco_REST_API_chatbot(String endereco_REST_API_chatbot) {
        this.endereco_REST_API_chatbot = endereco_REST_API_chatbot;
    }

    public void setData_de_criacao(Timestamp data_de_criacao) {
        this.data_de_criacao = data_de_criacao;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTotal_clicks(int total_clicks) {
        this.total_clicks = total_clicks;
    }

    public void setTotal_visualizacoes(int total_visualizacoes) {
        this.total_visualizacoes = total_visualizacoes;
    }

    public void setCpc_minimo(int cpc_minimo) {
        this.cpc_minimo = cpc_minimo;
    }
    
    
}
