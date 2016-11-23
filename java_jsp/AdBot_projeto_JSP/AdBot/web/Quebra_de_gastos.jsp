<%-- 
    Página : Quebra_de_gastos.jsp
    Sistema de Informação : AdBot
    Disciplina: PMR2490 - Sistemas de Informação
    Turma: 50 (2016)  Professor: Marcos Ribeiro Pereira Barretto
    Turma: 4(B) (2016)  Professor: José Reinaldo Silva  
    Desenvolvido em : NetBeans IDE 8.2, Java 1.8.0_111, Glass Fish Server 4.1.1
    Histórico de edição deste arquivo :
            [02/11/2016] Diego - Versão inicial
            [04/11/2016] Diego - Edições adicionais na formatação
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %>  <!importando biblioteca SQL do Java>
<%@ page import="java.util.Vector" %>
<%@ page import="transacoes_Controller.*" %>
<%@ page import="data_Model.*" %>
<%@ page import="DTO_Objects.*" %>
<%@ page import="java.lang.Integer.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<%
    // Verificação manual do Log in e obter o Usuario_ID da página "Homepage.jsp"
    if ( session.getAttribute("Usuario_ID") == null) {
       pageContext.forward("Homepage.jsp");
    }

    String Usuario_ID_st = (String)session.getAttribute("Usuario_ID");
    
    int Usuario_ID = Integer.parseInt(Usuario_ID_st);

%>    
    
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdBot Advertiser: Quebra de gastos Campaign/Media</title> <!-- Título da página -->
        <link rel="stylesheet" type="text/css" href="view.css" media="all">
        <script type="text/javascript" src="view.js"></script>
        <style type="text/css">

            .button_menu {
                background-color: #FF91A4;
                border: none;
                color: white;
                padding: 10px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 2px 2px;
                cursor: pointer;
            }
            
            .button_options {
                background-color: #E04C64;
                border: none;
                color: white;
                padding: 10px 15px;
                text-align: right;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 2px 2px;
                cursor: pointer;
            }   
            
            .button_log_out {
                background-color: #64AEA6;
                border: none;
                color: white;
                padding: 10px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 2px 2px;
                cursor: pointer;
            } 
            
            .button_play {
                background-color: #FF3F3F;
                border: none;
                color: white;
                padding: 10px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 2px 2px;
                cursor: pointer;
            }     
            
            .button_pause {
                background-color: #4CAF50;
                border: none;
                color: white;
                padding: 10px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 14px;
                margin: 2px 2px;
                cursor: pointer;
            }
            
            table.A {
                width: 100%; 
            }

            table.B {
                width: 100%; 
                padding: 5px;
                border-spacing: 5px;
                border-collapse: collapse;
                overflow: scroll;
                border-style: solid;
                border-width: 5px;
                border-color: #FF91A4;
            }

            th.B {
                border: 1px solid graytext;
                border-collapse: collapse;
                border-style: solid;
                border-width: 3px;
                border-color: #FF91A4;
            }

            td.B {
                border: 1px solid graytext;
                border-collapse: collapse;
                border-style: solid;
                border-width: 3px;
                border-color: #FF91A4;
            }

            tr.B:nth-child(even) {
                background-color: #FFC0CB;
                border-style: solid;
                border-width: 3px;
                border-color: #FF91A4;
            }

            tr.B:nth-child(odd) {
                background-color:#fff;
                border-style: solid;
                border-width: 3px;
                border-color: #FF91A4;
            }

            hr {
                border: none;
                height: 5px;
                background-color: #eee;
            }
        </style>
        <link rel="shortcut icon" href="imagens/icone_advertiser.ico" type="image/x-icon" />
    </head>
    
    <body id="main_body" >

        <img id="top" src="top.png" alt="">
        <div id="form_container">
            <br>
                
            <!------ Linha 1 ------>
            <h2>     
                <input id="Botao_Log_out" type="button" class="button_log_out" value="Log out">    
                <!------ Implementar rotina de Log Out -> On click function ------>
                <i><left><font color="#BF223C">&nbsp&nbsp&nbspAdBot: Advertiser</font></left></i>  
            </h2>
            
            <!------ Linha 2 ------>
            <a id="Botao_Perfil_advertiser" href="Perfil_de_advertiser.jsp" class="button_options">Perfil de <i>Advertiser</i></a>

<%
            UsuarioController uc = new UsuarioController();
            UsuarioNomeDTO ud = uc.getNomeUsuario(Usuario_ID);
%>
            <font size="3" color="#BF223C"><i>&nbsp&nbsp&nbspAdvertiser</i>: <%= String.format("%s %s", ud.getNome(), ud.getSobrenome()) %> </font>
                
            <!------ Título da página ------>
            <h3><center><font size="5" color="#FF5773">Quebra de gastos <i>Campaign</i>/<i>Media</i></font></center></h3>

            <br><hr><br>
                        
            <table class="B">
                <tr class="B">
                    <th class="B" bgcolor="#FFFFFF"><center>Nome da <i>Campaign</i></center></th>
                    <th class="B" bgcolor="#FFFFFF"><center>Nome da <i>Media</i></center></th>
                    <th class="B" bgcolor="#FFFFFF"><center>Gasto total</center></th>
                </tr>
                
<%
                    CampaignController cc = new CampaignController();
                    Vector lista_quebra = cc.getQuebraCampaignMediaDTO(Usuario_ID);
                    if ( (lista_quebra == null) || (lista_quebra.size() == 0)) {
                        // avisar usuario que nao há Campaigns
%>
                        Nenhuma <i>Campaign</i> foi encontrada!
<%                  } else {
                        String CampaignNome;
                        String MediaNome;
                        float Gasto_total_Campaign_Media;
                        for(int i = 0; i < lista_quebra.size(); i++){
                            QuebraCampaignMediaDTO qc = (QuebraCampaignMediaDTO)lista_quebra.elementAt(i);
                            CampaignNome = qc.getCampaignNome();
                            MediaNome = qc.getMediaNome();
                            Gasto_total_Campaign_Media = qc.getGasto();
                    
                            // Obter os totais de gastos para cada Campaign com cada Media (pois uma Media 
                            // pode ter mais de um cliente que clicou na propaganda)
                                // * Os itens do query do banco de dados já estão ordenados de forma a simplificar
                                 // o procedimento abaixo.
                            if((i + 1) < lista_quebra.size()){
                                QuebraCampaignMediaDTO qc2 = (QuebraCampaignMediaDTO)lista_quebra.elementAt(i + 1);
                                while(qc.getCampaignID() == qc2.getCampaignID() && qc.getMediaID() == qc2.getMediaID() && ((i + 1) < lista_quebra.size())){

                                    Gasto_total_Campaign_Media += qc2.getGasto();
                                    i++;
                                    if((i + 1) >= lista_quebra.size())
                                        break;
                                    qc2 = (QuebraCampaignMediaDTO)lista_quebra.elementAt(i + 1);
                                }
                            }

%>                    
                            <tr class="B">
                                <td class="B"><%= CampaignNome %></td>
                                <td class="B"><%= MediaNome %>&nbsp</td>
                                <td class="B" style="text-align:right"><%= String.format("%1.2f", Gasto_total_Campaign_Media) %>&nbsp</td>
                            </tr>  

<%
                        }
                    }
%>
               
            </table> 
                        
            <br><br>  
            <center>
                <a id="Botao_Voltar" href="Listagem_campaigns.jsp" class="button_options">Voltar</a> 
            </center>
            <br><br><hr><br>
                        
            <div id="footer">
                <font size="4"><i>AdBot</i> - PMR2490 (turma 4-B)</a></font>
            </div>
        </div>

        <img id="bottom" src="bottom.png" alt="">

    </body>

</html>