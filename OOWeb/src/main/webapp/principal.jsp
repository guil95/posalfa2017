<%@page import="br.com.munif.ooweb.Lugar"%>
<jsp:useBean class="br.com.munif.ooweb.Jogador" id="jogador" scope="session"/>
<jsp:useBean class="br.com.munif.ooweb.Mapa" id="mapa" scope="application"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    String movimento = request.getParameter("movimento");
    String mensagem = request.getParameter("mensagem");
    if (nome != null) {
        jogador.setNome(nome);
        jogador.setLugar(mapa.getLugarInicialJogador());
    }
    Lugar lc = jogador.getLugar();
    if (mensagem != null && mensagem.trim().length() > 0) {
        lc.getMensagens().add(jogador.getNome() + " : " + mensagem);
    }

    if (movimento != null && movimento.trim().length() > 0) {
        int opcao = Integer.parseInt(movimento);
        if (opcao == 1 && lc.getLeste() != null) {
            jogador.setLugar(lc.getLeste());
        } else if (opcao == 2 && lc.getOeste() != null) {
            jogador.setLugar(lc.getOeste());
        } else if (opcao == 3 && lc.getNorte() != null) {
            jogador.setLugar(lc.getNorte());
        } else if (opcao == 4 && lc.getSul() != null) {
            jogador.setLugar(lc.getSul());
        }
    }


%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Jogo 2017</title>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="jumbotron">
                        <h1>Olá <%=jogador.getNome()%></h1>
                        <%
                            lc = jogador.getLugar();
                        %>


                        <h2>Você está no(a): 
                            <%=jogador.getLugar().getDescricao()%></h2>
                    </div>
                    <div class="row">
                    <div class="col-xs-6">
                        <h4>Jogadores da sala:</h4>
                        <ul class="list-group">
                            <%
                                    for (int i = 0; i < jogador.getLugar().getPersonagens().size(); i++) { %>
                            <li class="list-group-item">
                                <%
                                    out.println(jogador.getLugar().getPersonagens().get(i));
                                %>
                            </li>  
                            <% }
                            %>
                        </ul>
                    </div>
                    <div class="col-xs-6">
                        <h4>Mensagens</h4>
                        <ul class="list-group">
                            <%
                            for (int i = 0; i < jogador.getLugar().getMensagens().size(); i++) { %>
                            <li class="list-group-item">
                                <%
                                    out.println(jogador.getLugar().getMensagens().get(i));
                                %>
                            </li>  
                            <% }
                            %>
                        </ul>
                    </div>
                    </div>
                    <div class="jumbotron">
                        <%
                        if (lc.getLeste() != null) {
                            out.println("1) Para leste " + lc.getLeste().getDescricao());
}%><br><%
                        if (lc.getOeste() != null) {
                            out.println("2) Para Oeste " + lc.getOeste().getDescricao());
}%><br>
                        <%if (lc.getNorte() != null) {
                            out.println("3) Para Norte " + lc.getNorte().getDescricao());
}%><br>
                        <%if (lc.getSul() != null) {
                            out.println("4) Para Sul " + lc.getSul().getDescricao());
                        }

                        %>
                    </div>
                </div>
            </div>
        </div>
        <form method="POST" action="principal.jsp">
            Movimento:<input type="text" name="movimento" value="" /><br/>
            Mensagem:<input type="text" name="mensagem" value="" /><br/>
            <input type="submit" value="Enviar" />
        </form>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
    </body>
</html>
