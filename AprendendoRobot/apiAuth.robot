*** Settings ***
Library        RequestsLibrary
Library        Collections
Library    String
Library    SeleniumLibrary
Resource       ./variables/passwords.robot

*** Variables ***
${ GITHUB_URL}    https://api.github.com/octocat

*** Test Cases ***
Cenario 01: Autenticacao basica
    Conectar com autenticacao na api do github
    Solicitar os dados do meu usuario


Cenario 02: Usando parametros
    Conectar na api sem autenticacao
    Solicitar um get que possui o codigo "abc" e o id "id123"

Cenario 03: Usando headers
    Conectar com autenticacao na api do github
    Enviar um post qualquer que possui headers   
*** Keywords ***
Conectar com autenticacao na api do github
    ${AUTH}    Create List    ${MY_GITHUB_USER}    ${MY_GITHUB_PASS}
    Create Session    alias=gitAuth    url=${GITHUB_URL}    auth=${AUTH}    disable_warnings=True  #comando para não acontecer problema de certificados
Solicitar os dados do meu usuario
    ${MY_USER_DATA}    GET    ${GITHUB_URL}
    # ${MY_USER_DATA}    GET On Session    alias=gitAuth    uri=/octocat
    # Log To Console    Meus dados:${MY_USER_DATA.json()}
    Confere sucesso na requisição    ${MY_USER_DATA}

Confere sucesso na requisição
    [Arguments]    ${RESPONSE}
    ${STATUS_200}    Run Keyword And Return Status        Should Be Equal As Strings    ${RESPONSE.status_code}    200
    ${STATUS_201}    Run Keyword And Return Status        Should Be Equal As Strings    ${RESPONSE.status_code}    201
    Run Keyword If    '${STATUS_200}'!='True' and '${STATUS_201}'!='True'    Fail    Erro na requisição!!Verifique: ${RESPONSE}


Conectar na api sem autenticacao
    Create Session    alias=gitSemAuth    url=${GITHUB_URL}    disable_warnings=True


 Solicitar um get que possui o codigo "${CODIGO}" e o id "${ID}"
    ${PARAMS}    Create Dictionary     codigo=${CODIGO}        id=${ID}
    ${REQUISICAO}    GET    ${GITHUB_URL}    params=${PARAMS}
    Log To Console    Lista:${REQUISICAO.json()}
    Confere sucesso na requisição    $RESPONSE

Enviar um post qualquer que possui headers    
    ${HEADERS}    Create Dictionary     campo=valor    application=json    apikey=dani
    ${REQUISICAO}    Post     headers=${HEADERS}     data={"campoJsonEntrada":"campoJsonValor"}
    Log    MeusDados:${REQUISICAO.json()}
    Confere sucesso na requisição    $RESPONSE