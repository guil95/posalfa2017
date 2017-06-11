<%@page import="br.com.munif.ooweb.Lugar"%>
<jsp:useBean class="br.com.munif.ooweb.Jogador" id="jogador" scope="session"/>
<jsp:useBean class="br.com.munif.ooweb.Mapa" id="mapa" scope="application"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String nome = request.getParameter("nome");
    String movimento = request.getParameter("movimento");
    String mensagem = request.getParameter("mensagem");
    
    if (nome != null && nome != "") {
        jogador.setNome(nome);
        jogador.setLugar(mapa.getLugarInicialJogador());
    }
    Lugar lc = jogador.getLugar();
    if (mensagem != null && mensagem.trim().length() > 0) {
        lc.getMensagens().add("<strong>"+jogador.getNome() + "</strong> : " + mensagem);
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
        <meta charset="utf-8">
        <title>Jogo 2017</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%
        if(nome == ""){ %>
    <div class="alert alert-danger">
        <p>Nome não pode ser vazio, digite nome.</p>
    </div>
        <a href="index.html" class="btn btn-primary">Voltar</a>
    
    <% return;}   

        %>
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
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h1 class="panel-title"><strong>Movimentos</strong></h1>
                        </div>
                        <table class="table-condensed table-striped">
                            <tbody>
                            <ul class="list-group">
                                <%
                                    if (lc.getLeste() != null) {
                                %>
                                <li class="list-group-item">
                                    <%
                                        out.println("1) Para leste " + lc.getLeste().getDescricao());
                                    %>
                                </li>
                                <%
                                    }
                                    if (lc.getOeste() != null) {
                                %>
                                <li class="list-group-item">
                                    <%
                                            out.println("2) Para Oeste " + lc.getOeste().getDescricao());
                                           %>
                                </li>
                                <%
                                    } %>
                                    <%
                                        if (lc.getNorte() != null) {%>
                                <li class="list-group-item">
                                <%
                                            out.println("3) Para Norte " + lc.getNorte().getDescricao());
                                        %>
                                    </li><%
                                        }
                                        if (lc.getSul() != null) {
%>
<li class="list-group-item"><%

                                            out.println("4) Para Sul " + lc.getSul().getDescricao());
%></li><%
                                        }

                                    %>
                            </ul>
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-xs-6">
                            <form method="POST" action="principal.jsp">
                                <div class="form-group">
                                    <label>Movimento:</label>
                                    <input class="form-control" type="text" name="movimento" value="" /><br/>
                                    <label>Mensagem:</label>
                                    <textarea class="form-control" type="text" name="mensagem" value="" ></textarea><br/>
                                    <input class="btn btn-primary" type="submit" value="Enviar" />
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
