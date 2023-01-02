*** Settings ***
Documentation     Essa suite testa o site da Amazon
Resource          amazon_resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]    Este teste verifica o menu eletronico do site
    ...                e verifica a categoria de computadores e informatica
    [Tags]             menus
   Dado que estou na home page da Amazon.com.br
   Então o título da página deve ficar "Amazon.com.br | Tudo pra você, de A a Z."
   Quando acessar o menu "Eletrônicos"
   E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
   E a categoria "Computadores e Informática" deve ser exibida na página 
    

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste pesquisa um produto
    ...                e verifica se a busca é realizada
    [Tags]             busca_produtos
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página  

