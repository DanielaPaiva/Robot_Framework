*** Settings ***
Library        OperatingSystem
*** Variables ***


*** Test Cases ***
Cenario 01: Criando arquivo
    Criando um arquivo de texto
    Criando um arquivo json

Cenario 02: Copiando arquivos
    Copiando o arquivo
Cenario 03: Lendo meu arquivo
    Lendo o conteudo
    Lendo o binario
Cenario 04: Excluindo arquivos
    Listando arquivos do diretorio
    Excluir arquivo   exemplo.txt 
    Excluir arquivo   exemplo.json
    Listando arquivos do diretorio 

*** Keywords ***
Criando um arquivo de texto
    # Create File    C:\Users\danie\OneDrive\Área de Trabalho\AutomacaoRobotFramework  Este texto vai parar no arquivo que eu criei
    Create File    ./myFiles/exemplo.txt  Tem um texto aqui!!!
Criando um arquivo json
    Create File    ./myFiles/exemplo.json    {"teste":"numeroUm","teste2":"numeroDois"}

Copiando o arquivo
    Copy File    ./myFiles/exemplo.txt    ./myFiles/exemplo_Copia.txt    
    Copy File    ./myFiles/exemplo.json    ./myFiles/exemplo_Copia.json

Lendo o conteudo
    ${MEU_ARQUIVO}     Get File    ./myFiles/exemplo.txt
    ${SIZE}            Get File Size    ./myFiles/exemplo.txt
    Log To Console    ${MEU_ARQUIVO}

Lendo o binario
    Should Exist    ./myFiles/exemplo.txt    msg=O arquivo não existe!! Verifique!
    ${MEU_ARQUIVO}     Get Binary File    ./myFiles/exemplo.txt
    ${SIZE}            Get File Size    ./myFiles/exemplo.txt
    Log To Console    ${MEU_ARQUIVO}
    Log To Console    ${SIZE}

Listando arquivos do diretorio
        List Directory    ./myFiles    

Excluir arquivo
    [Arguments]        ${ARQUIVO}   
    Remove File    ./myFiles/${ARQUIVO}     