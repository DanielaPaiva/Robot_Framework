*** Settings ***
Library        Process
*** Variables ***


*** Test Cases ***
Cenario 01: Abrir programas
    Abrir e fechar o bloco de notas
    

Cenario 02: Executando e aguardando scripts


Cenario 02: Executando comandos do prompt


*** Keywords ***
Abrir e fechar o bloco de notas
    ${Meu_PROCESSO}    Start Process    C:\\Windows\\System32\\notepad.exe
    # Sleep 3s   
    Terminate Process    ${Meu_PROCESSO}    kill=True




    # ASSISTIR ESSE VIDEO DEPOIS