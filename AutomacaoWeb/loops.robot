*** Settings ***

Library    SeleniumLibrary

*** Variables ***
@{NUMEROS}    0     1     2     3     4     5     6     7     8     9     10     11


*** Test Cases ***
Cenario 01: Exibir a lista
    Exibindo os valores da lista normal
    Exibindo os valores da lista com OR

*** Keywords ***
Exibindo os valores da lista normal
    Log To Console  ${\n}
    FOR     ${NUMERO_ATUAL}    IN    @{NUMEROS}
        IF     ${NUMERO_ATUAL}==5
            Log to console   SOU O NÚMERO 5!
        ELSE IF     ${NUMERO_ATUAL} ==10
            Log To Console    SOU O NÚMERO 10!
        ELSE 
            Log to console     Eu sou o número ${NUMERO_ATUAL}!! 
        END
    END    
    Log To Console  ${\n}


Exibindo os valores da lista com OR  
    Log To Console  ${\n}
    FOR    ${NUMERO_ATUAL}    IN    @{NUMEROS}
        IF    ${NUMERO_ATUAL} == 5 or ${NUMERO_ATUAL} == 10
            Log To Console    SOU O NÚMERO ${NUMERO_ATUAL}!
        ELSE
            Log To Console    Eu sou o número ${NUMERO_ATUAL}!!
        END 
    END 
                
        
           

    # FOR    ${NUMERO_ATUAL}    IN   @{NUMEROS}
    #   IF  ${NUMERO_ATUAL} == 5 or ${NUMERO_ATUAL} == 10
    #       Log To Console    Eu sou o número ${NUMERO_ATUAL}!
    #   ELSE
    #       Log To Console    Eu não sou o número 5 e nem o 10!
    #   END
    # END