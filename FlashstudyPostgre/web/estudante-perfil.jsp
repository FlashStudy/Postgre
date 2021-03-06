<%@page import="model.Usuario"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean class="model.Usuario" id="usuario" scope="page"/>

<!DOCTYPE html>

<html lang="pt-BR">
    <head>
        <title>Flashstudy: Perfil</title>

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

        <style>
            IMG.displayed {
                display: block;
                margin-left: auto;
                margin-right: auto;
                padding: 15px;
                width: 400px;
            }

            .jumbotron{
                width: 80%;
            }

            #contFt{
                text-align: center;
            }

            body{
                background-color: #2C3E50;
            }
        </style>

        <script type="text/javascript">
            function editaDados() {
                document.getElementById("btnSalva").type = "button";
                document.getElementById("btnCancela").type = "button";
                document.getElementById("csenha").disabled = false;
                document.getElementById("nome").disabled = false;
                document.getElementById("senha").disabled = false;
                document.getElementById("ft").disabled = false;

            }

            function salvaDados() {
                var s1 = document.getElementById("senha").value;
                var s2 = document.getElementById("csenha").value;

                if (s1 !== s2) {
                    window.alert("As senhas diferem!");
                } else {
                    var r = window.confirm("Tem certeza em editar os dados?");
                    if (r == true) {
                        document.getElementById("formUs").submit();
                    }

                }
            }

            function cancela() {
                document.getElementById("btnSalva").type = "hidden";
                document.getElementById("btnCancela").type = "hidden";
                document.getElementById("csenha").disabled = true;
                document.getElementById("nome").disabled = true;
                document.getElementById("senha").disabled = true;
                document.getElementById("ft").disabled = true;

            }
        </script>

    </head>

    <body>
        <%
            HttpSession sessao = request.getSession();
            usuario = (Usuario)sessao.getAttribute("usuario");
            
        %>

        <nav class="navbar navbar-expand-lg navbar-light bg-primary rounded">
            <a class="navbar-brand h1 mb-0 icon icon-group" href="estudante-inicial.jsp"> FlashStudy</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link icon icon-calendar"     href="estudante-cronograma.jsp" style="color: #383838"> Cronograma</a>
                    <a class="nav-item nav-link icon icon-refresh link"      href="estudante-ciclo.jsp" style="color: #383838"> Ciclo de estudos</a>
                    <a class="nav-item nav-link icon icon-pushpin"      href="estudante-flashcards.jsp" style="color: #383838"> Flashcards</a>  
                    <a class="nav-item nav-link icon icon-user"         href="estudante-perfil.jsp" style="color: #383838"> Perfil</a>
                    <a class="nav-item nav-link icon icon-question-sign" href="estudante-ajuda.jsp" style="color: #383838"> Ajuda</a>
                    <a class="nav-item nav-link icon icon-signout"      href="executar_login" style="color: #383838"> Sair</a>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="title" >
                <h2 class="icon icon-user" style="color: #cccccc"> Perfil</h2>
                <span class="byline" style="color: #cccccc">Verifique e edite os seus dados</span>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-sm-12 col-xsm-12">
                    <div class="container" id="contFt">
                        <IMG class="displayed" src="img/user-default.png" alt="Usuário"/>              
                    </div>
                </div>

                <div class="col-lg-6 col-md-12 col-sm-12 col-xsm-12">
                    <div class="container">                                
                        <div class="jumbotron">

                            <form name="formUs"  id="formUs" action="UsuarioServlet" method="GET">

                                <div class="form-group row">
                                    <label for="inputPassword" class="col-sm-2 col-form-label">Nome:</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="nome" name="nome" value="<%=usuario.getNome()%>" disabled/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="staticEmail" class="col-sm-2 col-form-label">Email:</label>
                                    <div class="col-sm-10">
                                        <input type="text" readonly class="form-control" id="email" name="email" value="<%=usuario.getEmail()%>"/>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="senha" class="col-sm-2 col-form-label">Senha:</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="senha" name="senha" value="<%=usuario.getSenha()%>" disabled/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="csenha" class="col-sm-2 col-form-label">Confirma:</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="csenha" name="csenha" placeholder="Confirma nova senha"  disabled/>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="ft" class="col-sm-2 col-form-label">Foto:</label>
                                    <div class="col-sm-10">
                                        <input type=file class="form-control" id="ft" name="ft" disabled/>
                                    </div>
                                </div>

                                <div class="form-group form-inline">

                                    <input type="button" onclick="editaDados()" class="form-control btn btn-primary" id="btnEdita" value="Editar dados" style="margin:10px"/>
                                    <input type="hidden" onclick="salvaDados()" class="form-control btn btn-success" id="btnSalva" value="Salvar dados" style="margin:10px"/>
                                    <input type="hidden" onclick="cancela()" class="form-control btn btn-danger"  id="btnCancela" value="Cancelar" style="margin:10px"/>

                                </div>
                            </form>

                        </div>
                    </div>
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