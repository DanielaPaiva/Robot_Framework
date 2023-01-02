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
    Acessar a home page do site Amazon.com.br 
    Verificar se o titulo da pagina fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    

Caso de Teste 02 - Pesquisa de um Produto
    [Documentation]    Este teste pesquisa um produto
    ...                e verifica se a busca é realizada
    [Tags]             busca_produtos
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa 
    Clicar no botão de pesquisa 
    Verificar o resultado da pesquisa esta listando o produto "Console Xbox Series S"
