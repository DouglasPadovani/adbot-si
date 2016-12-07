<%-- 
    Página : Atributos_de_uma_campaign.jsp
    Sistema de Informação : AdBot
    Disciplina: PMR2490 - Sistemas de Informação
    Turma: 50 (2016)  Professor: Marcos Ribeiro Pereira Barretto
    Turma: 4(B) (2016)  Professor: José Reinaldo Silva  
    Desenvolvido em : NetBeans IDE 8.2, Java 1.8.0_111, GlassFish Server 4.1.1
    
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %>  <!--importando biblioteca SQL do Java-->
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Date" %>
<%@ page import="transacoes_Controller.*" %>
<%@ page import="java.lang.Integer.*" %>
<%@ page import="data_Model.*" %>
<%@ page import="DTO_Objects.*" %>

<!-- Importa classes do projeto (Servlets) -->
<%@ page import="utils.Logout" %>

<html xmlns="http://www.w3.org/1999/xhtml">


            <%
                
                // Obtém o Campaign_ID passado pela página que chamou esta página (Listagem_campaigns.jsp)
                String Campaign_ID_st = request.getParameter("Campaign_ID");
                session.setAttribute("Campaign_ID", Campaign_ID_st);    
                int Campaign_ID = Integer.parseInt(Campaign_ID_st);
                
                // Instanciar CampaignController
                CampaignController cc = new CampaignController();
                    
                // Obter uma das Campaigns da visualizacao
                VisualizacaoCampaignDTO vc = cc.visualizarCampaign(Campaign_ID);
                    
                // Obter todos os atributos de uma campaign
                
                






            %>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>AdBot Advertiser: Atributos da Campaign</title> <!-- Título da página -->
            <link rel="stylesheet" type="text/css" href="view.css" media="all">
            <script type="text/javascript" src="view.js"></script>
            <link rel="stylesheet" type="text/css" href="index.css"> <!-- Arquivo com as formatações de página e cores dos tipos de botão -->
            <link rel="shortcut icon" href="imagens/icone_advertiser.ico" type="image/x-icon" />
        </head>
    
    <body id="main_body" >
        
        <img id="top" src="top.png" alt="">
        <div id="form_container">
        
         <br>
                
            <!------ Linha 1 ------>
            <h2>
                <form action="Logout"> <!-- [Victor Teodoro: 28/11/2016] -->
                    <input id="Botao_Log_out" type="submit" class="button_log_out" value="Log out">
                    <i><left><font color="#BF223C">&nbsp&nbsp&nbspAdBot: Advertiser</font></left></i>  
                </form> 
            </h2>
            
            <!------ Linha 2 ------>
            <a id="Botao_Perfil_advertiser" href="Perfil_de_advertiser.jsp" class="button_options">Perfil de <i>Advertiser</i></a>
        
        
        
        <!------ Título da página ------>
        <h3><center><font size="5" color="#FF5773">Atributos da <i>Campaign</i></font></center></h3>    
        <br><hr><br>   
                    
            
                
                <br> <font size="4" color = "A71010"><center>Nome da <i>Campaign</i>: <%= vc.getNome() %></center></font>
                <br> <font size="4" color = "A71010"><center>ClickURL: <%= vc.getClickURL() %></center></font> 
                <br> <font size="4" color = "A71010"><center>ID da <i>Campaign</i>: <%= vc.getID() %></center></font>
                <br> <font size="4" color = "A71010"><center>Bid<br>(R$/click): <%= String.format("%1.2f", vc.getBid()) %></center></font>
                <br> <font size="4" color = "A71010"><center>Tipo do produto da <i>Campaign</i>: <%= vc.getTipo_produto() %></center></font>
                <br> <font size="4" color = "A71010"><center>Marca do produto da <i>Campaign</i>: <%= vc.getMarca_produto() %></center></font>           
                <br> <font size="4" color = "A71010"><center>Total de visualizações: <%= vc.getTotal_visualizacoes() %></center></font>            
                <br> <font size="4" color = "A71010"><center>Total de <i>clicks</i>: <%= vc.getTotal_clicks() %> </center></font>          
                <br> <font size="4" color = "A71010"><center>Gasto total da <i>Campaign</i>: <%= String.format("%1.2f", vc.getGasto_total()) %> </center></font>          
                <br> <font size="4" color = "A71010"><center>Limite máximo de gasto (R$): <%= String.format("%1.2f", vc.getLimite_gasto()) %> </center></font>          
                <br> <font size="4" color = "A71010"><center>Genero alvo: <%= vc.getGenero_alvo() %>    </center></font>        
                <br> <font size="4" color = "A71010"><center>Idade mínima: <%= vc.getIdade_alvo_min() %> </center></font>           
                <br> <font size="4" color = "A71010"><center>Idade máxima: <%= vc.getIdade_alvo_max() %>  </center></font>         
                <br> <font size="4" color = "A71010"><center>Link para a figura: <%= vc.getLink_figura_da_impression() %></center></font>
                <br> <font size="4" color = "A71010"><center>Data de criacao: <%= vc.getData_de_criacao() %></center></font>
                <br> <font size="4" color = "A71010"><center>Black ou whitelist: <%= vc.getBlack_ou_whitelist() %>  </center></font> 
                        
                        
                            
             <br><br><hr><br>   
            
            <center> <!-- Botão embaixo da página -->
                
                <a id="Botao_Voltar" href="Listagem_campaigns.jsp" class="button_options">Voltar</a> 
                <a id="Botao_Metricas_de_performance" href="Metricas_de_performance_de_uma_campaign.jsp?Campaign_ID=<%=Campaign_ID_st%>" class="button_options">Métricas de Performance</a> 
                <a id="Botao_Click_logs" href="Download_de_click_logs.jsp?Campaign_ID=<%=Campaign_ID_st%>" class="button_options">Click logs</a> 
                
                
                
            </center>
                
                
            <br><br><hr><br>
                 
            <img id="bottom" src="bottom.png" alt="">

            <div id="footer">
                <font size="4"><i>AdBot</i> - PMR2490 (turma 4-B)</a></font>
            </div>
        

        <img id="bottom" src="bottom.png" alt="">
                
        </div> 
        
    </body>
</html>
