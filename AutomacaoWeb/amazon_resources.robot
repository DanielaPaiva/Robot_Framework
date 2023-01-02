*** Settings ***
Library        SeleniumLibrary


*** Variables ***
${BROWSER}                    chrome
${URL}                        https://www.amazon.com.br/
${MENU_ELETRONICOS}           xpath=//a[.='Eletrônicos']
${TITULO_DEPARTAMENTO}        xpath=//span/span[.='Eletrônicos e Tecnologia']
${BARRA_PESQUISA}             css=#twotabsearchtextbox  
${PESQUISAR}                  css=#nav-search-submit-button  

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br 
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Verificar se o titulo da pagina fica "${TITULO}"
    Title Should Be    title=${TITULO}

Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Element Is Visible    locator=${TITULO_DEPARTAMENTO}
    # Wait Until Page Contains    text=${TITULO_DEPARTAMENTO}
    
Verificar se aparece a categoria "${CATEGORIA_ELETRONICOS}"
    Wait Until Element Is Visible    locator=xpath=//a[5]/span[normalize-space(.)='${CATEGORIA_ELETRONICOS}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${BARRA_PESQUISA}    text=${PRODUTO}

Clicar no botão de pesquisa 
    Click Element    locator=${PESQUISAR}

Verificar o resultado da pesquisa esta listando o produto "${NOME_PRODUTO}" 
    Wait Until Element Is Visible    locator=//span[.='${NOME_PRODUTO}']

#Gherkin 
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br 
    Verificar se o titulo da pagina fica "Amazon.com.br | Tudo pra você, de A a Z."
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Amazon.com.br | Tudo pra você, de A a Z."
    Verificar se o titulo da pagina fica "Amazon.com.br | Tudo pra você, de A a Z."

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Title Should Be    title=Amazon.com.br : Xbox Series S
E um produto da linha "Xbox Series S" deve ser mostrado na página 
    Verificar o resultado da pesquisa esta listando o produto "Console Xbox Series S"
