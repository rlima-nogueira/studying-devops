# Comandos Docker #
Lista todos os containers ativos</br>
``` docker ps ```

Lista todos os containers que já foram criados </br>
``` docker ps -a ```

Executar o comando de escrita dentro do ubuntu</br>
``` docker run ubuntu echo "Ola mundo!!" ```

Colocar o terminal atrelado ao container </br>
```docker run -it <nome do container> ```

Encerra o terminal atrelado ao container</br>
```ctrl+D ```

Startar um container que ja foi criado</br>
```docker start <id do container>```

Parar o container </br>
```docker stop <id container>```

Para o container sem esperar 10 segundos </br>
``` docker stop -t 0 <id container> ```

Startar o container com o terminal atrelado (-a = attach) </br>
```docker start -a -i <id do container> ```

Remover container que não está sendo usado </br>
``` docker rm <id container> ``` 

Remover container está sendo usado </br>
``` docker rm -f <id container> ```

Limpar todos os containers inativos</br>
```docker container prune ```

Limpar todas imagens inativas</br>
```docker image prune ```

Limpar as imagens dos containers</br>
```docker rmi <nome image> ```

Trava o terminal porque ele ta simulando um servidor de uma pagina web</br>
```docker run docker-samples/static-site```

Deixa o terminal liberado </br>
```docker run -d dockersamples/static-site```

Linkar uma porta do container com uma porta aleatoria do pc (-d  = detach, -P = porta aleatoria)</br>
```docker run -d -P dockersamples/static-site```

Verificar qual porta o container esta utilizando</br>
```docker port <id container>```

Linkar a porta do pc com uma porta especifica do containeir (-d  = detach, -p = porta especifica)</br>
```docker run -d -p 1234:80 dockersamples/static-site```

Linkando a porta especifica com nome do container</br>
```docker run -d --name meu-site -p 1234:80 dockersamples/static-site```

Variavel de ambiente "-e "</br>
```docker run -d -P --name site-teste -e AUTHOR="Rafaela" dockersamples/static-site```

Retorna so os ids dos containers</br>
```docker ps -q```

Executa o stop em quem retornar dessa lista</br>
```docker stop $(docker ps -q)```


Quando crio um volume dentro de um container, estamos criando uma pasta no docker host.

Criando um container com volume </br>
``` docker run -v "/var/www" ubuntu```

Verificar o volume que tu criou </br>
```docker inspect <id container>```

Escrever na pasta que eu criei pelo volume atraves de uma pasta no docker host, com terminal ativo</br>
```docker run -it -v "<caminho da pasta no seu pc>:/var/www" ubuntu```</br>
```cd var/www```

realizar o comando que quiser, por exemplo</br>
```touch meu-arquivo.txt``` </br>
```echo "teste de arquivo" > meu-arquivo.txt```

## Criando um ambiente node

"-w": work directory </br>
```docker run -p 8080:3000 -v "C:\Users\rafaela.nogueira\Desktop\Pessoal\estudos\volume-exemplo:/var/www" -w "/var/www" node npm start ```


pwd -> mostrar o caminho que vc ta

## Docker files ##
Exemplo de um dockerfile.
```
#Imagem base está sendo construida a partir da imagem base da ultima versão do node
    FROM node:latest  
#Que é mantida por mim
    MAINTAINER Rafaela Lima Nogueira
#Variaveis de ambiente 
    ENV NODE_ENV=production
    ENV PORT=3000
#Copia todos os arquivos pra dentro da pasta /var/www
    COPY . /var/www
#Começa nessa pasta aqui 
    WORKDIR /var/www
#Roda o npm install 
    RUN npm install
#Roda npm start
    ENTRYPOINT npm start
#Na porta 3000
    EXPOSE $PORT
```


## Buildar a imagem do docker ## 
```docker build -f <nome do arquivo> -t rlima-nogueira/node <pasta que ta>```</br>

## Criando a própria rede
```docker network create --driver bridge <nome da rede>```

## Docker Compose ##
Exemplo de um ```docker-compose.yml``` onde temos três servidores node, um nginx para compilar arquivos estáticos e um banco de dados mongo. Esse serviço segue uma ordem de execução, sendo primeiro o banco, depois os servidores node e em seguida o nginx. 
```
#Versão mais recente do docker-compose
version: '3'

#Lista os serviços que serão criados
services: 
    nginx:
        build: 
            dockerfile: ./docker/nginx.dockerfile
            context: .
        image: douglasq/nginx
        container_name: nginx
        ports: 
            - "80:80"
        networks:
            - production-network
        #Este serviço depende desses outros abaixo para subir
        depends_on: 
            - "node1"
            - "node2"
            - "node3"
    
    mongodb:
        image: mongo
        networks: 
            - production-network

    node1: 
        build: 
            dockerfile: ./docker/alura-books.dockerfile
            context: .
        image: douglasq/alura-books
        container_name: alura-books-1
        ports: 
            - "3000" 
        networks: 
            - production-network
        #Este serviço depende desse outro abaixo para subir
        depends_on: 
            - "mongodb"
    
    node2: 
        build: 
            dockerfile: ./docker/alura-books.dockerfile
            context: .
        image: douglasq/alura-books
        container_name: alura-books-2
        ports: 
            - "3000" 
        networks: 
            - production-network
        #Este serviço depende desse outro abaixo para subir
        depends_on: 
            - "mongodb"


    node3: 
        build: 
            dockerfile: ./docker/alura-books.dockerfile
            context: .
        image: douglasq/alura-books
        container_name: alura-books-3
        ports: 
            - "3000" 
        networks: 
            - production-network
        #Este serviço depende desse outro abaixo para subir
        depends_on: 
            - "mongodb"

#Criando nossa propria rede      
networks:
    production-network:
        driver: bridge 
```
Para executar o yml: </br>
``` docker-compose build ```

Para subir todos os containers que estão no compose com detach: </br>
``` docker-compose up -d ```

Listar os serviços que estão rodando: </br>
``` docker-compose ps ```

Parar e remover containers: </br>
``` docker-compose down ```

Pra executar um comando dentro de um container específico que está configurado dentro do composer: </br>
``` docker exec -it alura-books-1 ping alura-books-2```

