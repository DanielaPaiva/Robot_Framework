*** Settings ***
Library             FakerLibrary   locale=pt_BR
Library             String

*** Variables ***
${NOME}            Fa
${SOBRENOME}        FakerLibrary.Last name
${PALAVRA}        FakerLibrary.Word
&{PESSOA}   nome=${NOME}   sobrenome=${SOBRENOME}

*** Test Cases ***
Imprimindo um e-mail customizado e aleatório
    ${EMAIL_CRIADO}    Criar e-mail customizado e aleatório    ${PESSOA.nome}    ${PESSOA.sobrenome}
    Log To Console     ${EMAIL_CRIADO}


*** Keywords ***
Criar e-mail customizado e aleatório
    [Arguments]       ${NOME}  ${SOBRENOME}
    # ${ALEATORIA}      Generate Random String
    ${EMAIL_FINAL}    Set Variable    ${NOME}${SOBRENOME}${PALAVRA}@testerobot.com
    [Return]          ${EMAIL_FINAL}





# *** Settings ***
# Documentation   Faker com dados brasileiros
# Library         FakerLibrary    locale=pt_BR

# *** Variables ***
# ${NOME}                     FakerLibrary.name       
# ${SOBRENOME}                FakerLibrary.Last Name
# ${PALAVRA}                  FakerLibrary.Word 

# *** Test Cases ***
# Cenário: Mostrar um email com variavel argumentos
#     Exibir email personalizado
        

# *** Keywords ***
# Exibir email personalizado  
#         [Arguments]        ${NOME}  ${SOBRENOME}
#         ${EMAIL}        O EMAIL CRIADO: ${NOME}${SOBRENOME}${PALAVRA}@testerobot.com
#         Log To Console    ${EMAIL}
         
  
