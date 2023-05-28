*** Settings ***


*** Variable ***
@{MESES}       janeiro   fevereiro   marco    abril   maio   junho   julho   agosto   setembro   outubro   novembro   dezembro   



*** Test Cases ***
Cenario: Testando lista
     Exibir os meses       

*** Keywords ***
Exibir os meses
        Log to console     Esse é o mes: ${MESES[0]}
        Log to console     Esse é o mes: ${MESES[1]}
        Log to console     Esse é o mes: ${MESES[2]}
        Log to console     Esse é o mes: ${MESES[3]}
        Log to console     Esse é o mes: ${MESES[4]}
        Log to console     Esse é o mes: ${MESES[5]}
        Log to console     Esse é o mes: ${MESES[6]}
        Log to console     Esse é o mes: ${MESES[7]}
        Log to console     Esse é o mes: ${MESES[8]}
        Log to console     Esse é o mes: ${MESES[9]}
        Log to console     Esse é o mes: ${MESES[10]}
        Log to console     Esse é o mes: ${MESES[11]}
        Log to console     Exemplos: ${MESES[8:10]}     #Pega intervalo
        Log to console     Exemplo: ${MESES[0:10:2]}    #Pula de 2 em 2


#*** Variables ***
#@{MESES}   janeiro
#...        fevereiro
#...        março
#...        abril
#...        maio
#...        junho
#...        julho
#...        agosto
#...        setembro
#...        outubro
#...        novembro
#...        dezembro        