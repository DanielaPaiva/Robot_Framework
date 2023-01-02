***Settings***
Documentation         Este teste será realizado para validar....
Resource              api_resources.robot
Suite Setup            Conectar a api



***Test Case***
Buscar a listagem de todos os livros utilizando o metodo GET
        Requisitar a api
        Conferir o status code   200    
        Conferir o reason        OK
        Conferir se a lista retorna com "200" livros
        


