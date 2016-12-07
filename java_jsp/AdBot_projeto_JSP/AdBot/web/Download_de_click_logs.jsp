<%-- 
    Página : Download_de_click_logs.jsp
    Sistema de Informação : AdBot
    Disciplina: PMR2490 - Sistemas de Informação
    Turma: 50 (2016)  Professor: Marcos Ribeiro Pereira Barretto
    Turma: 4(B) (2016)  Professor: José Reinaldo Silva  
    Desenvolvido em : NetBeans IDE 8.2, Java 1.8.0_111, GlassFish Server 4.1.1
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.sql.*" %>                 <!-- Importando biblioteca SQL do Java -->
<%@ page import="java.util.Vector" %>           <!-- Importando variável Vector de Java -->
<%@ page import="transacoes_Controller.*" %>    <!-- Importando Controllers -->
<%@ page import="data_Model.*" %>               <!-- Importando Models -->
<%@ page import="DTO_Objects.*" %>              <!-- Importando DTOs -->
<%@ page import="java.lang.Integer.*" %>        <!-- Importando Integer de Java (para poder utilizar Integer.parseInt) -->
<%@ page import="utils.Logout" %>               <!-- Importando Servlet de Logout [Victor Teodoro: 28/11/2016] -->

<html xmlns="http://www.w3.org/1999/xhtml">
    <%    
   
    

    // Obtém o Campaign_ID passado pela página que chamou esta página (Listagem_campaigns.jsp)
    String Campaign_ID_st = request.getParameter("Campaign_ID");
    session.setAttribute("Campaign_ID", Campaign_ID_st);    
    int Campaign_ID = Integer.parseInt(Campaign_ID_st);

    // Instanciar CampaignController
    CampaignController cc = new CampaignController();   
    
    // Obter vetor com todas as Campaigns com os dados a serem exibidos na listagem
    Vector dc = cc.getClick_logs(Campaign_ID);

   
    
    
    
    
%>


    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AdBot Advertiser: Click logs</title> <!-- Título da página -->
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
            <!------ Linha 2 ------>
            <a id="Botao_Perfil_advertiser" href="Perfil_de_advertiser.jsp" class="button_options">Perfil de <i>Advertiser</i></a>
            
        <!------ Título da página ------>
        <h3><center><font size="5" color="#FF5773">Click logs da <i>Campaigns</i></font></center></h3>
        
        
        <%
            for(int i = 0; i < dc.size(); i++){
        
        // Obter uma das Campaigns da listagem
        Click_logDTO cl = (Click_logDTO)dc.elementAt(i);
            
            
      %>      
            
        <br> <font size="4" color = "A71010"><center><i>Nome de Cliente</i>: <%= cl.getNome_cliente() %></center></font>
        <br> <font size="4" color = "A71010"><center><i>Idade do Cliente</i>: <%= cl.getIdade_cliente()  %></center></font>
        <br> <font size="4" color = "A71010"><center><i>IP dp Cliente</i>: <%= cl.getIP_cliente() %></center></font>
        <br> <font size="4" color = "A71010"><center><i>Genero do Cliente</i>: <%= cl.getGenero_cliente() %></center></font>
        <br> <font size="4" color = "A71010"><center><i>Gasto por Click</i>: <%= cl.getGasto_click() %></center></font>
        
            
        <br><hr><br>
        <br><hr><br>
                    
            <%
                }
            %>
            
            
            <br><hr><br>  
                        
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
                    
    </body>
</html>
