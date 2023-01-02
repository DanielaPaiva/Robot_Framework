*** Settings ***

*** Variables ***

*** Test Cases ***
Cenario 1: Percorrer os ranges
    Range tradicional
    Range quantidade informada
    Range aritmetico
    Range com intervalos especificos
*** Keywords ***
Range tradicional
    [Documentation]    Percorre de 1 até 10
    Log To Console    ${\n}
    FOR    ${index}    IN RANGE    1    11    
        Log to console   ${index}
    END
    Log To Console    ${\n}
Range quantidade informada   
    [Documentation]    Percorre de 0 até 9
    Log To Console    ${\n}
    FOR    ${index}    IN RANGE    10
        Log to console    ${index} 
    END 

Range aritmetico
    [Documentation]    Percorre de 0 até 5
    
    # Criamos uma variavel que informa o valor maximo
    ${VAR}    Set Variable    ${5}
    Log To Console    ${\n}
    FOR    ${index}    IN RANGE    ${VAR}+1
        Log to console    ${index}
    END


Range com intervalos especificos
    [Documentation]    Percorre de 0 até 30 masvai pular de 5 em 5
    Log to console  ${\n}
    FOR    ${index}    IN RANGE    0    30    5
        Log To Console   ${index}
        
    END
