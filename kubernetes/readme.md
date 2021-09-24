# KUBERNETES #
## O que é Kubernetes? ##
O Kubernetes nos permite fazer uma escalabilidade horizontal do nosso poder computacional, pois ele possibilita que as máquinas trabalhem em paralelo. Com ele, você pode gerenciar uma ou múltiplas máquinas que estão trabalhando em conjunto e isso, nós podemos chamar de cluster. 

## O que é Cluster? ##
É um conjunto de máquinas trabalhando em conjunto. 

## Como o CLUSTER é composto? ##
## Master ##
Responsável por gerenciar o cluster, manter e atualizar o estado desejado, receber e executar novos comandos. É composto por: 
- API -> API Rest (receber e executar novos comandos);
- C-M (Controller Manager) -> Manter e atulizar os estados desejados;
- Scheduler -> Responsável por definir onde determinado pod vai ser executado no nosso cluster;
- ETCD -> Responsável por armazenar todos os dados vitais do nosso cluster através de um banco de dados chave-valor. </br>

Esse conjunto, forma um <b>Control Plane.</b>

## NODES ## 
Responsável por executar as aplicações e são compostos por:  
- Kubelet -> responsável pela execução dos pod dentro dos nodes;
- KubeProxy -> responsável pela comunicação entre os nossos nodes dentro do nosso cluster.
Esse conjunto, forma um <b>Control Plane Nodes.</b>

<h3>Como utilizamos a API para comunicar com nosso cluster? </h3>
Através do Kubectl. 

> Kubectl 
 é o que nos permite ter as funcionalidades de criar, ler, atualizar e remover os dados, os componentes, os recursos do nosso cluster de maneira declarativa ou imperativa. Com ele, é possível criar arquivos de definição ou executarmos comandos que será enviado através um request para a nossa API REST, que fará toda a mágica acontecer dentro do nosso cluster.

## Habilitar kubernetes no docker ## 
Vá até configurações do docker desktop > kubernetes > Habilitar Kubernetes 
Aguarde a reinicialização do docker. 

<h3>Verificar o cluster criado</h3>

``` kubectl get nodes ```

## O que são PODS? ## 
Pods são capsulas que podem conter um ou mais containers. 
Os pods geram um ip automatico e cada container dentro dele tem uma porta específica.
Quando o pod falha, ele sobe outro automaticamente com outro ip. 

<h3> Criando um POD </h3>

```kubectl run nginx-pod --image=nginx:latest```

<h3> Verificando os pods criados </h3>

```kubectl get pods```

<h3> Verifica a atualização de status em tempo real </h3>

```kubectl get pods --watch```

<h3> Ver o que tem dentro do pod </h3>

```kubectl describe pod <nome do pod>```

<h3> Editar um pod já existente de forma hiperativa (não recomendado) </h3>

``` kubectl edit pod <nome do pod> ```

Após este comando abrirá um bloco de notas, a partir disso, basta você procurar pelo que quer alterar e fazer isso. 

<h3> Criando um pod de maneira declarativa </h3>

``` primeiro-pod.yaml``` 
```
#Qual versão da API que queremos usar
apiVersion: v1

#Tipo do recurso
kind: Pod

#Nome do Pod
metadata:
    name: primeiro-pod-declarativo

#Especificações do pod
spec: 
    containers:
    #O "-" quer dizer um array
        - name: nginx-container
          image: nginx:latest
```

Para executar o yaml, execute o comando: (-f é o caminho do arquivo) </br>
``` kubectl aplly -f .\primeiro-pod.yaml ```

Deletar um pod</br>
```kubectl delete pod <nome do pod>``` 

Deletar um yaml de pod</br>
``` kubectl delete pod <caminho do arquivo .yaml>``` 

Abrindo o bash dentro de um pod (-it é o terminal interativo) </br>
``` kubectl exec -it <nome do pod> -- bash ```

Verificar os ips dos pods </br>
``` kubectl get pods -o wide ```

## Services ##
- Abstrações que expoem a aplicação executando em um ou mais pods
- Gera IP de comunicação que não muda (IP do service)
- Gera DNS para um ou mais pods 
- Conseguem fazer o balanceamento de carga

<h3> Existem 3 tipos de serviços </h3>
- ClusterIP
- NodePort
- LoadBalancer

## ClusterIP ## 
-> Faz a comunicação entre diferentes pods dentro de um mesmo cluster;
-> A comunicação é unilateral, então o pod que tem o service recebe a comunicação de forma estável, mas não se comunica com outro pod, caso eles não tenham um service;
-> O clusterIP não permite acessos externos, somente interno. 

``` 
#Versão da api
apiVersion: v1

#Tipo do serviço que estamos criando
kind: Service

#O nome do serviço
metadata:
  name: svc-pod-2

#Especificações
spec:

#É um clusterip
  type: ClusterIP

#Selecionando a label do pod que eu quero
  selector:
    app: segundo-pod

#Atribuindo a porta 
  ports:
    #Vai ouvir na porta abaixo
    - port: 9000
    #Vai despachar nessa porta
      targetPort: 80
```

## NodePort ##
- Permitem comunicação com o mundo externo, ou seja é possível enviar uma requisição através de um navegador para um pod que está dentro do cluster

``` 
#Versão da api
apiVersion: v1

#Tipo do serviço que estamos criando
kind: Service

#O nome do serviço
metadata:
  name: svc-pod-1

#Especificações
spec:

#É um nodeport
  type: NodePort

#Selecionando a label do pod que eu quero
  selector:
    app: primeiro-pod

#Atribuindo a porta 
  ports:
    #Vai ouvir na porta abaixo
    - port: 80
    #Porta fixa pra acessar de fora
      nodePort: 30000
    #Variaveis de ambiente acopladas ao arquivo da subida de imagem
    env: 
        - name: "MYSQL_ROOT_PASSWORD"
          value: "q1w2e3r4"
        - name: "MYSQL_DATABASE"
          value: "empresa"
        - name: "MYSQL_PASSWORD"
          value: "q1w2e3r4"
```

## LoadBalancer ##
Abre a comunicação para o mundo externo usando o loadbalancer do provedor (Google Cloud, AWS, Azure e etc)


Deletar vários pods </br>
``` kubectl delete pods --all ```

Deletar vários serviços </br>
``` kubectl delete svc --all ```

### Configs maps ### 
Com o configmap você desacoplar informações de configurações, acessos, de subida de imagens. Também é possível reutilizar as configurações, por exemplo, de um banco de dados.

```
#Versão
apiVersion: v1
#Tipo
kind: ConfigMap
#Nome e label para conseguir acessar pelo service
metadata:
    name: db-configmap
    labels: 
        app: db-configmap
        
#Os dados de configuração 
data: 
  MYSQL_ROOT_PASSWORD: q1w2e3r4
  MYSQL_DATABASE: empresa
  MYSQL_PASSWORD: q1w2e3r4
```

## Replica Set ## 
-> ReplicaSet é uma estrutura que pode encapsular um ou mais Pods.
``` 
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: portal-noticias-replicaset
spec: 
  template:
    #metadata do pod
    metadata:
        name: portal-noticias
        labels: 
          app: portal-noticias
    #especificações do pod
    spec: 
      containers:
          - name: portal-noticias-container
            image: aluracursos/portal-noticias:1
            ports: 
              - containerPort: 80
            envFrom:
              - configMapRef:
                  name: portal-configmap
  replicas: 3
  #Esse selector tem que ser sempre o name do metadata do pod
  selector:
    matchLabels:
      app: portal-noticias
```


## Deployment ## 

O deployment tem a mesma função do replica set, porém com ele é possível fazer o controle de versão do .yaml, funcionando como se fosse o controle de versão do git, por exemplo.

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec: 
  #quantidade de pod que deve subir
  replicas: 3
  template:
    #metadata do pod
    metadata:
        name: nginx-pod
        labels: 
          app: nginx-pod
    #especificações do pod
    spec: 
      containers:
          - name: nginx-container
            image: nginx:stable
            ports: 
              - containerPort: 80
  #Esse selector tem que ser sempre o name do metadata do pod
  selector:
    matchLabels:
      app: nginx-pod
```

Após fazer uma mudança no pod do deployment:</br>
``` kubectl apply –f <nome do deployment>.yaml --record ```

Para verificar as versões do deployment: </br>
```kubectl rollout history deployment <nome do deployment>```

Para fazer uma anotação no "CHANGE-CAUSE" do --record</br>
``` kubectl annotate deployment <nome do deployment> kubernetes.io/change-cause="MENSAGEM QUE VOCÊ QUISER" ```

Rollback do yaml de acordo com a Versão </br>
```kubectl rollout deployment <nome do deployment> --to-revision=<numero da versao>```

## Persistindo dados ## 
Pods foram feitos para serem destruídos, porém os dados precisam ser mantidos. Para isso, podemos criar um volume que persista atraves do hostPath. 

### HostPath ### 
É uma pasta que criamos no nosso computador para persistir os dados do pod. Caso o pod seja destruído os dados estarão salvos. 

```
apiVersion: v1
kind: Pod
metadata:
  name: pod-volume
spec: 
#definindo containers dentro do pod
  containers:
    - name: nginx-container
      image: nginx:latest
      #Esse comando irá criar a pasta dentro do container
      volumeMounts:
        - mountPath: /volume-dentro-do-container
          name: primeiro-volume
    - name: jenkins-container
      image: jenkins:alpine
      volumeMounts:
        - mountPath: /volume-dentro-do-container
          name: primeiro-volume
  volumes:
    - name: primeiro-volume
    #Caminho da pasta no computador
      hostPath:
        path: /C/Users/rafaela.nogueira/Desktop/Pessoal/estudos/kubernetes/portal-noticias/volumes/primeiro-volume
        type: Directory
```


## Contexts ## 
```kubectl config get-contexts ```

```kubectl config use-context <nome do cluster>```

<b>Configurando a porta da minha máquina com o cluster local</b></br>

```kubectl port-forward <nome do cluster> 8080:80```


 -> configmap -> deployment -> services