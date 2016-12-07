<%-- 
    Página : Metricas_de_performance_de_uma_campaign.jsp
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

<%@ page import="utils.Logout" %>

<html xmlns="http://www.w3.org/1999/xhtml">

   
    
<%    
    // Verificação manual do Log in
    if ( session.getAttribute("Usuario_ID") == null ) {
       pageContext.forward("Log_in_de_usuario.jsp");
    }
    

    // Obtém o Campaign_ID passado pela página que chamou esta página (Listagem_campaigns.jsp)
    String Campaign_ID_st = request.getParameter("Campaign_ID");
    session.setAttribute("Campaign_ID", Campaign_ID_st);    
    int Campaign_ID = Integer.parseInt(Campaign_ID_st);





    
%>



<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdBot Advertiser: Métricas de Performance da</title> <!-- Título da página -->
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
            <h3><center><font size="5" color="#FF5773">Métricas de Performance da <i>Campaigns</i></font></center></h3>

            <br><hr><br>            
                        
            <table class="B">
                <tr class="B">
                    <th class="B" bgcolor="#FFFFFF"><center>Nome da <i>Campaign</i></center></th>
                    <th class="B" bgcolor="#FFFFFF"><center>(Gasto total da <i>Campaign</i>)/<br> &nbsp(Total de visualizações) <br> (R$/visualização)</center></th>
                    <th class="B" bgcolor="#FFFFFF"><center>(Gasto total da <i>Campaign</i>)/<br> &nbsp(Total de <i>clicks</i>) <br> (R$/<i>click</i>)</center></th>
                    <th class="B" bgcolor="#FFFFFF"><center>(Total de <i>clicks</i>)/<br> &nbsp(Total de visualizações) <br> (<i>click(s)</i>/visualização)</center></th>
                </tr>
                
                
                
<%                  // Inicializar totais de visualizações, clicks e gasto
                        int Total_visualizacoes;
                        int Total_clicks;
                        double Gasto_total;
                        double gasto_por_visualizacao;
                        double gasto_por_click;
                        double clicks_por_vizualizacao;
                        
                    // Instanciar CampaignController
                    CampaignController cc = new CampaignController();
                    
                    // Obter uma das Campaigns da listagem
                    ListagemCampaignsDTO lc = cc.getAtributosCampaignParaMetricasPerformance(Campaign_ID);
                    
                    // Atualizar totais de visualizações, clicks e gasto
                    Total_visualizacoes = lc.getTotal_visualizacoes();
                    Total_clicks = lc.getTotal_clicks();
                    Gasto_total = lc.getGasto_total();

                    gasto_por_visualizacao = Gasto_total/Total_visualizacoes;
                    gasto_por_click = Gasto_total/Total_clicks;
                    clicks_por_vizualizacao = Total_clicks/Total_visualizacoes;

%>

                    <tr class="B"> <!-- Exibir os valores gerais na última linha da tabela -->
                            <td class="B" bgcolor="#ADD8E6" style="text-align:center">Valores gerais: </td>        
                            <td class="B" bgcolor="#ADD8E6" style="text-align:right"><%= gasto_por_visualizacao %>&nbsp</td>
                            <td class="B" bgcolor="#ADD8E6" style="text-align:right"><%= gasto_por_click %>&nbsp</td>
                            <td class="B" bgcolor="#ADD8E6" style="text-align:right"><%= clicks_por_vizualizacao %>&nbsp</td>          
                        </tr>
                        
            
            </table> 
                        
            <br><br>  
            <center> <!-- Botão embaixo da página -->
                <a id="Botao_Voltar" href="Atributos_de_uma_campaign.jsp?Campaign_ID=<%=Campaign_ID_st%>" class="button_options">Voltar</a> 
            </center>
            <br><br><hr><br>
                            

            <!-- Créditos --> 
            <div id="footer">
                <font size="4"><i>AdBot</i> - PMR2490 (turma 4-B)</a></font>
            </div>
            
        </div>

        <img id="bottom" src="bottom.png" alt="">

    </body>

</html>        