# VIRTUAL PRIVATE CLOUD - Amazon VPC

VPC é global
Subnet é regional

Internet Gateway -> Portão de saída/entrada para internet toda


Default VPC
Custom VPC

Endereços Privados
Classe A - 10.0.0.0 -> 10.255.255.255
Classe B - 172.16.0.0 -> 172.31.255.255
Classe C - 192.168.0.0 -> 192.168.255.255


Primeiro ip é rede
ultimo IP broadcast
a AWS reversa 3 ips 
1 endereçamento disponível da rede - roteador VPC
2 endereçamento disponivel - servidor de dns
3 ip - uso futuro 


## NAT - Network address translation
Este caso é para quando precisamos de um endereçamento publico e também de um endereçamento privado. Ou seja, temos máquinas falando entre si e também falando com a web. Toda vez que bate no NAT o endereçamento privado é traduzido para o público e então ele fala com a web. 

## NAT Instance 
- Dispositivo que criamos, como se fosse um servidor (não tem tanta escalabilidade). Em um cenário de alta disponibilidade, não é uma opção interessante, já que se a EC2 cair, todo roteamento cai. 
## NAT Gateway 
- Como se fosse uma aplicação


## VPC FLOW LOG 
Pode ser colocado no CloudWatch ou no S3 Bucket. Ip de destino, Ip de entrada, quem está acessando quem. 

## Bastion Hosts
- Uma forma de proteger sua topologia cloud, pois só é possível acessar todas as outras máquinas a partir dessa máquina. 

## Gateway Endpoint
- Permite acessar um serviço da aws sem ter a saída para a internet. Cria um "tunel" (endpoint) para os serviços da aws. 