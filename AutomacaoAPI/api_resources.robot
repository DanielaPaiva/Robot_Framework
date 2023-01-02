*** Settings ***
Library                RequestsLibrary
Library                Collections
    

***Variable***
${URL}                https://fakerestapi.azurewebsites.net/api/




*** Keywords ***

Conectar a api
        Create Session    apiFaker    ${URL}
        Log  message
Requisitar a api
    ${RESPOSTA}     Get Request    apiFaker    Books
    Log           ${RESPOSTA.json()} 
    Set Task Variable    ${RESPOSTA}
Conferir o status code    
    [Arguments]        ${STATUS_CODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA.status_code}    ${STATUS_CODE_DESEJADO}

Conferir o reason        
    [Arguments]        ${REASON_DESEJADO}
    Should Be Equal As Strings     ${RESPOSTA.reason}      ${REASON_DESEJADO}  second
    
Conferir se a lista retorna com "${QNT_LIVROS}" livros
    Length Should Be    ${RESPOSTA.json()}     ${QNT_LIVROS}