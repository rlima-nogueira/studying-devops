b# Capitulo 01 - Conhecendo o kubernets #
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



    


