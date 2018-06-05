<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Usuario"%>
<%@page import="model.Flashcard"%>

<jsp:useBean class="model.Usuario"   id="usuario" scope="page"/>
<jsp:useBean class="dao.Flashcard"   id="dao"     scope="page"/>

<!DOCTYPE html>

<html lang="pt-BR">
    <head>
        <title>Flashstudy: Flashcards</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="css/estudante-padrao.css" rel="stylesheet" type="text/css" media="all" />
        <link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

        <link rel="shortcut icon" href="img/icon.png" type="image/ico">        

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom fonts for this template -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

        <!-- Plugin CSS -->
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

        <!-- Custom styles for this template -->
        <link href="css/freelancer.min.css" rel="stylesheet">

        <style type="text/css">
            #area{
                height: 100%;
            }

            #flash1{
                background-color: cadetblue;
                width: 80%;
                height: 250px;
                margin: auto;
                margin-bottom: 20px;
                padding: 5px;
            }

            #flash2{
                background-color: lightgreen;
                width: 80%;
                height: 250px;
                margin: auto;
                margin-bottom: 20px;
                padding: 5px;;
            }

            #resposta{
                height: 240px;
            }

            #pergunta{
                height: 180px;
            }

            .jumbotron{
                height: 100%;
            }

            .btn-group-wrap {
                text-align: center;
            }

            div.btn-group {
                margin: 0 auto; 
                text-align: center;
                width: inherit;
            }

            a {
                float: left;   
            }

            form{
                padding-top: 15px;
            }

            h4{
                padding: auto;
                margin-left: 50px;
            }

            body{
                background-color: #2C3E50;
            }
        </style>

        <script type="text/javascript">
            function validaCampos() {
                titulo = document.getElementById("titulo").value;
                pergunta = document.getElementById("pergunta").value;
                resposta = document.getElementById("resposta").value;

                if ((titulo === "") || (pergunta === "") || (resposta === "")) {
                    window.alert("Algum campo não está preenchido!");
                } else {
                    document.getElementById("flashcard").submit();
                }
            }
        </script>
    </head>

    <body>
        <%
            HttpSession sessao = request.getSession();
            usuario = (Usuario)sessao.getAttribute("usuario");
            
            String email = usuario.getEmail();
                                    
            ArrayList<Flashcard> cards = dao.getByEmail(email);
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-primary rounded">
            <a class="navbar-brand h1 mb-0 icon icon-group" href="estudante-inicial.jsp"> FlashStudy</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link icon icon-calendar"      href="estudante-cronograma.jsp" style="color: #383838"> Cronograma</a>
                    <a class="nav-item nav-link icon icon-refresh link"  href="estudante-ciclo.jsp"      style="color: #383838"> Ciclo de estudos</a>
                    <a class="nav-item nav-link icon icon-pushpin"       href="estudante-flashcards.jsp" style="color: #383838"> Flashcards</a>  
                    <a class="nav-item nav-link icon icon-user"          href="estudante-perfil.jsp"     style="color: #383838"> Perfil</a>
                    <a class="nav-item nav-link icon icon-question-sign" href="estudante-ajuda.jsp"      style="color: #383838"> Ajuda</a>
                    <a class="nav-item nav-link icon icon-signout"       href="executar_login"           style="color: #383838"> Sair</a>
                </div>
            </div>
        </nav>



        <div class="title">
            <h2 class="icon icon-pushpin" style="color: #cccccc"> Flashcards</h2>
            <span class="byline" style="color: #cccccc">Crie e edite todos os seus flashcards</span>
        </div>

        <div class="container" id="area">
            <div class="jumbotron">
                <div class="row">
                    <div class="col-lg-12">
                        <form id="flashcard" action="FlashcardServlet" method="POST">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="btn-group-wrap">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-dark" title="Favoritar"        id="btnFav" >
                                                <a class="icon icon-star"> Favoritar</a>
                                            </button>
                                            <button type="button" class="btn btn-dark" title="Salvar"           id="btnSave" onclick="validaCampos()">
                                                <a class="icon icon-save"> Salvar</a></button>
                                            <button type="button" class="btn btn-dark" title="Criar novo"       id="btnNovo">
                                                <a class="icon icon-plus-sign"> Novo</a>
                                            </button>
                                            <button type="button" class="btn btn-dark" title="Editar flashcard" id="btnEdit">
                                                <a class="icon icon-edit"> Editar</a>
                                            </button>
                                            <button type="button" class="btn btn-dark" title="Deletar"          id="btnDel" >
                                                <a class="icon icon-trash"> Deletar</a>
                                            </button>
                                            <button type="button" class="btn btn-dark" id="btnPublic">
                                                <input title="Outros terão acesso ao flashcard" type="checkbox" name="publico" value="Público"/>
                                                <spam> Público?</spam>
                                            </button>
                                        </div>   
                                    </div>  
                                </div>
                                <div class="col-lg-6">
                                    <div class="display-4">
                                        <h4>Pergunta</h4>
                                    </div>
                                    <div class="jumbotron" id="flash1">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="titulo" placeholder="Título do flashcard" name="titulo">
                                        </div>
                                        <div class="form-group">
                                            <textarea class="form-control" placeholder="Insira a sua pergunta aqui" id="pergunta" name="pergunta"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="display-4">
                                        <h4>Resposta</h4>
                                    </div>
                                    <div class="jumbotron" id="flash2">
                                        <div class="form-group">
                                            <textarea class="form-control" placeholder="Insira a sua resposta aqui" id="resposta" name="resposta"></textarea>
                                            <input type="hidden" name="email" value="<%= email%>"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">

            <div class="jumbotron">
                <div class="title">
                    <h2>Seus flashcards</h2>
                </div>
                <div class="row">
                    <%
                        int i;
                        for(i=0; i<cards.size();i++){     
                    %>
                    <div class="col-lg-4 col-md-6 col-sm-12" style="margin-top: 5px">
                        <div class="card align-self-center" style="width: 18rem;">
                            <div class="card-body">
                                <h5 class="card-title"><%= cards.get(i).getTitulo()%></h5>
                                <p class="card-text">
                                <ul>
                                    <li>Nível: <%= cards.get(i).getNivel()%></li>
                                    <li>Status: <%= cards.get(i).getPublico()%></li>
                                    <li>Matéria: null</li>
                                    <li>Assunto: null</li>
                                </ul>
                                </p>
                                <a href="#" class="btn btn-primary">Seleciona</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    %>    
                </div>
            </div>
        </div>


        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Plugin JavaScript -->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

        <!-- Contact Form JavaScript -->
        <script src="js/jqBootstrapValidation.js"></script>
        <script src="js/contact_me.js"></script>

        <!-- Custom scripts for this template -->
        <script src="js/freelancer.min.js"></script>

    </body>
</html>