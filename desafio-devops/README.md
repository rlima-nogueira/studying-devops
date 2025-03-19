# DESAFIO DEVOPS - FABRICIO VERONEZ (18-23/03/2025)

### Aula 1 - Primeiros passos com DevOps e Docker
Link da Aula: https://imersao.devopspro.com.br/aula/desafio-docker/

DockerHub: https://hub.docker.com/

> Comandos Docker: 

**PARA CRIAR UM CONTAINER**
``` 
docker container run <nome-da-imagem>

exemplo:
docker container run hello-world
```

**PARA LISTAR CONTAINERS EM EXECUÇÃO**
```
docker container ls
``` 

**PARA LISTAR CONTAINERS JÁ EXECUTADOS**
```
docker container ls -a
``` 

**PARA EXECUTAR CONTAINERS SETANDO VARIAVEIS DE AMBIENTE E DEIXANDO O TERMINAL LIVRE PARA OUTROS COMANDOS**
```
docker container run -e VARIAVEL_DE_AMBIENTE=TESTE -d <nome-da-imagem>
```

**Criando um PORT BIND ou PUBLISH PORT entre o container e a máquina do usuário**
```
docker container run -e VARIAVEL_DE_AMBIENTE=TESTE -d -p PORTA_MAQUINA:PORTA_CONTAINER <nome-da-imagem>

exemplo: 
docker container run -e VARIAVEL_DE_AMBIENTE=TESTE -d -p 5432:5432 <nome-da-imagem>
```

**PARA REMOVER UM CONTAINER**
```
docker container rm -f <ID_CONTAINER>
```

---

Link do Evento: https://imersao.devopspro.com.br/evento/
Professor: Fabricio Veronez