*** Settings ***
Library        String
Library        OperatingSystem
*** Variables ***


*** Test Cases ***
Cenario 01: Lidando com linhas de um txt String
    Contando as linhas
    Pegando uma linha especifica
    Pegando uma linha especifica com a palavra "linha 01"
    Pegando até um marcador

Cenario 02: Manipulando a String
    Substituindo valores no texto
    Quero tudo em maiusculo
    Quero tudo em minusculo

*** Keywords ***
Criar e pegar arquivo
# Criar um arquivo txt
    Create File    ./myFiles/arquivo_texto.txt    Minha linha 00\nMinha linha 01\nMinha linha 03\nMinha linha 04\nMinha linha 05\nMinha linha 06\n
# Pegar o arquivo
    ${CONTEUDO_ARQUIVO}    Get File    ./myFiles/arquivo_texto.txt
    [Return]    ${CONTEUDO_ARQUIVO}


Contando as linhas
    ${STRING}    Criar e pegar arquivo
    ${LINHAS}    Get Line Count    ${STRING}
    Log To Console    Meu arquivo tem:${LINHAS} LINHAS!!


Pegando uma linha especifica
    ${STRING}    Criar e pegar arquivo
    ${LINHAS}    Get Line    ${STRING}    3
    Log To Console    ${LINHAS}
    FOR    ${NUMERO_LINHA}    IN RANGE    0    5    
        ${CONTEUDO_LINHA}    Get Line    ${STRING}    ${NUMERO_LINHA}
        Log To Console   Conteudo da linha ${NUMERO_LINHA} do arquivo:\n "${CONTEUDO_LINHA}"
    
    END

Pegando uma linha especifica com a palavra "${PALAVRA}"
    ${STRING}    Criar e pegar arquivo
    ${LINHAS}    Get Lines Containing String    ${STRING}    ${PALAVRA}
    Log To Console    Linha com a palAvra ${PALAVRA}: ${LINHAS}


Pegando até um marcador
    ${STRING}    Criar e pegar arquivo
    ${LINHAS}    Get Line    ${STRING}    0        #Vai olhar a linha zero do arquivo
    ${RECORTAR_COMECO}    Fetch From Left    ${LINHAS}    0    #QUANDO ENCONTRARUM ZERO NA LINHA ELE PARA DE RECORTAR E ARMAZENA NA VARIAVEL (DA FRENTE PARA TRAS)
    ${RECORTAR_FIM}    Fetch From Right    ${LINHAS}     linha   #QUANDO ENCONTRARUM A PALAVRA "LINHA"  ELE VAI PARAR DE RECORTAR E ARMAZENARÁ NA VARIAVEL (DE TRAS PRA FRENTE)
    Log To Console    Começo: ${RECORTAR_COMECO}\nFim:${RECORTAR_FIM}
    ${TESTE}    Get Substring    ${LINHAS}    12    14        #Recorta no tamanho que eu passo pra ele -> nesse caso, vai retornar somente o 00
    Log To Console    Teste:${TESTE}

Substituindo valores no texto
    ${STRING}    Criar e pegar arquivo
    ${NOVO_TEXTO}    Replace String    string=${STRING}    search_for=Minha linha    replace_with=Novo texto da linha
    Log To Console    Texto anteigo:${STRING}\NTexto atual:${NOVO_TEXTO}
    Create File    ./myFiles/meuArquivoNovo.txt    ${NOVO_TEXTO}


Quero tudo em maiusculo
    ${STRING}    Criar e pegar arquivo
    ${STRING}    Convert To Upper Case    ${STRING}
    Log To Console    Maiusculo:\n${STRING}

Quero tudo em minusculo   
    ${STRING}    Criar e pegar arquivo
    ${STRING}    Convert To Lower Case    ${STRING}
    Log To Console    Minusculo:\n${STRING}