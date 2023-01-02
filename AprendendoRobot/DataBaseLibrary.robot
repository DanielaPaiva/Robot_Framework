*** Settings ***
Documentation    Instalar: "pip install -U robotframework-databaselibrary"
...              Para acessar o BD o Robot precisa conhecer o Driver de cada banco, então precisamos instala:
...              PostgreSQL: "pip install psycopg2"
...              SQLite 3: Não precisa instalar nada
...              MySQL: "pip install PyMySQL"
...              Oracle: "pip install cx-Oracle"
Library          DatabaseLibrary
Test Setup       Conectar no Banco de Dados
Test Teardown    Desconectar do Banco de Dados




*** Test Cases ***
Cenario 01: Executar scripst via arquivos
    Executar script via ARQUIVO no Banco de Dados    ${CURDIR}/my_sql/create_table.sql   #neste arquivo tem que ter o select do sql
    Executar script via ARQUIVO no Banco de Dados    ${CURDIR}/my_sql/insert_table.sql  
    Confere se "May Fernandes" foi inserido com sucesso

Cenario 02: Executar scripst via String
    Executar script via STRING no Banco de Dados    INSERT INTO public.account(user_id, username,password) VALUES (2,'Dani',1234)    
    Confere se "Luiz Silva" foi inserido com sucesso

Cenario 03: Select Statement   
    ${RESPOSTA_SELECT}    Executar query no banco de Dados    SELECT * FROM nometabela
    Log To Console    ${RESPOSTA_SELECT} 

##Pegar um campo especifico, utilize tuplas [NUM_LINHA][NUM_COLUNA]
    Log    Usuario:${RESPOSTA_SELECT[0][0]} - Nome:${RESPOSTA_SELECT[0[1]]}

Cenario 04: Limpando Tabela
    Limpar Tabela    account(nomedatabela) 
    Executar script via STRING no Banco de Dados    DROP table account(NomeTabela)   





*** Keywords ***
 Conectar no Banco de Dados
    #Exemplo1
    Connect To Database  dbapiModuleName=cx_Oracle    dbName=nomeBanco    dbUsername=NOMEUsuario     dbPassword=SenhaUsuario    dbHost=localhost    dbPort=5432

    #Exemplo2
    # Connect To Database Using Custom Params   dbapiModuleName=cx_Oracle    db_connect_string="${DBName}/${DBUser}@${DBHost}:${DBPort}/${DBalias}"

Desconectar do Banco de Dados
    Disconnect From Database    


Executar script via STRING no Banco de Dados
    [Arguments]    ${SCRIPT}
    Execute Sql String    sqlString=${SCRIPT}

Executar script via ARQUIVO no Banco de Dados
    [Arguments]    ${FILE}
    Execute Sql Script    sqlScriptFileName=${FILE}  

Executar query no banco de Dados
    [Arguments]    ${QUERY}
    ${RESPONSE_QUERY}    Query    selectStatement=${QUERY} 
    [Return]    ${RESPONSE_QUERY}

Confere se "${USER}" foi inserido com sucesso
    Check If Exists In Database    selectStatement=SELECT username FROM account WHERE username='${USER}'    

Limpar Tabela
    [Arguments]     ${TABELA}
    ${REGISTROS}    Row Count    selectStatement=SELECT * FROM ${TABELA}   







#     Teste DatabaseLibrary
#     Connect To Database Using Custom Params      cx_Oracle      '${DB_USER}/${DB_PWD}@${DB_HOST}:${DB_PORT}/${DB_SID}'
#     ${TESTE}     Query       select * from TABELA_X
#     Log ${TESTE}
# Lembrando que o SID é o service_name que vc encontra no tnsnames.ora