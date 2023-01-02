*** Settings ***
Library        DateTime
*** Variables ***


*** Test Cases ***
Cenario 01: Pegando data e hora atuais
    Pegar data atual 
    Pegar data e hora atuais
    Pegar ano - mes- dia separados

Cenario 02: Trabalhando com o tempo
    Trabalhar com o tempo
    Adicionando tempo de data
    Subtraindo tempo de data

*** Keywords ***
Pegar data atual
    Log To Console    ${\n}
    ${AGORA}    Get Current Date    result_format=%d-%m-%y
    Log To Console    ${AGORA}


Pegar data e hora atuais
    Log To Console    ${\n}
    ${AGORA}    Get Current Date    result_format=%d-%m-%Y %H:%M:%S
    Log To Console    ${AGORA}


Pegar ano - mes- dia separados
    Log To Console    ${\n}
    ${HOJE}    Get Current Date
    ${HOJE}    Convert Date    ${HOJE}    datetime
    Log To Console    ${HOJE.day} - ${HOJE.month} - ${HOJE.year}
    Log To Console      ${HOJE.hour}  ${HOJE.minute}  ${HOJE.second}

Trabalhar com o tempo
    Log To Console    ${\n}
    ${HORA}    Convert Time    1 minute 30 seconds
    Log To Console    São ${HORA} segundos em 1 minuto e 30 segundos
    ${HORA}    Convert Time    5400    verbose
    Log To Console    5400 segundos é ${HORA} 
    ${HORA}    Convert Time    5500     timer    exclude_millis=yes
    Log To Console    5500 segundos é ${HORA}


Adicionando tempo de data

    # ADICIONANDO HORAS
    ${ANTES}     Get Current Date
    ${DEPOIS}    Add Time To Date    ${ANTES}    4 hours   result_format=%d-%m-%Y %H:%M:%S
    Log To Console   Antes:${ANTES} - Depois:${DEPOIS}

    # ADICIONANDO DIAS
    ${ANTES}     Get Current Date
    ${DEPOIS}    Add Time To Date    ${ANTES}    7 days   result_format=%d-%m-%Y %H:%M:%S
    Log To Console   Antes:${ANTES} - Depois:${DEPOIS}



Subtraindo tempo de data
# ADICIONANDO HORAS
    ${ANTES}     Get Current Date
    ${DEPOIS}    Subtract Time From Date     ${ANTES}    25 minutes   result_format=%d-%m-%Y %H:%M:%S
    Log To Console   Antes:${ANTES} - Depois:${DEPOIS}

    # ADICIONANDO DIAS
    ${ANTES}     Get Current Date
    ${DEPOIS}    Subtract Time From Date    ${ANTES}    2 days   result_format=%d-%m-%Y %H:%M:%S
    Log To Console   Antes:${ANTES} - Depois:${DEPOIS}
