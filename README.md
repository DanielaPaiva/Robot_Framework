### Documentação

- Para executar somente um ct: "robot -t "NOME_DO_CT" NOME_DO_ARQUIVO
Exemplo: robot -t "Caso de teste " amazon_testes.robot

- Para executar somente uma feature: robot NOME_DO_ARQUIVO_FEATURE
Exemplo: robot amazon_testes.robot

- Comandos robot: robot --help

- Executar tags: robot -i NOME_DA_TAG NOME_DO_ARQUIVO

- Não executar alguma tag: robot -e NOME_DA_TAG NOME_DO_ARQUIVO

- b Cria uma pasta e adiciona os outputs(log/ screenshot/report) lá dentro: robot -d NOME_DA_PASTA NOME_DO_ARQUIVO
Exemplo: robot -d resultados amazon_teste.robot

- Substituir o valor de uma variavel: robot -v NOME_DA_VARIAVEL:NOVO_VALOR
Exemplo: robot -v BROWSER:firefox

 
PARA SABER AS ULTIMAS ATUALIZAÇÕE DO FRAMEWORK. ACESSE: https://github.com/robotframework/robotframework/tree/master/doc/releasenotes