*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    String
Resource    ./variables/passwords.robot
Resource    ./apiAuth.robot
*** Variables ***
${GITHUB_URL}    https://api.github.com/octocat

*** Test Cases ***
Cenario 01: Post com template
    Conectar com autenticacao na api do github        #O correto seria deixar esse metodo em um arquivo generico
    Realizar um post com o campo "testeValor"

*** Keywords ***
Realizar um post com o campo "${CAMPO}"
    ${BODY}    Format String    ${CURDIR}/data/input/postExemplo.json   #POSSO PASSAR UMA STRING OU YM ARQUIVO
    ...        NameUser_git=${MY_GITHUB_USER}    #-->CAMPO QUE EU QUERO QUE MUDE
    ...        label=${CAMPO}
    Log To Console    Meu body ficou:\n${BODY}
    ${RESPONSE}    Post Request    alias=gitAuth    uri=${GITHUB_URL}    data=${BODY}
    Confere sucesso na requisição    ${RESPONSE}