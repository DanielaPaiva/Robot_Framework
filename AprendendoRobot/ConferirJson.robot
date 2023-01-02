*** Settings ***
Library    RequestsLibrary
Library    OperatingSystem
Library    Collections

*** Variables ***


*** Test Cases ***
Cenario 01: Conferindo Json complexo
    Confere objetos e Sub-objetos do Json
    Confere lista Json

*** Keywords ***
Pega Json
#Necessario pegar o output
    ${MEU_JSON_COMPLEXO}    Get File    ${CURDIR}/data/output/jsonComplexo.json
    ##Como o comando de cima retorna uma String, precisamos converter para Json
    ${MEU_JSON_COMPLEXO}    To Json    ${MEU_JSON_COMPLEXO}
    [Return]    ${MEU_JSON_COMPLEXO}



Confere objetos e Sub-objetos do Json
    ${MEU_JSON_COMPLEXO}    Pega Json
    ${}
Confere lista Json    