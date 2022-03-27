# Elastic Computer - Máquinas virtuais 

### On-Demand
-> Você tem a máquina disponível a qualquer instante
-> O valor é um pouco mais alto 

### Spots
-> Recurso até 90% mais barato
-> Se a AWS precisar dos recursos dessa máquina, eles desligam e pegam de volta, ou seja você não tem garantia de que sua máquina vai ficar lá por X tempo. 

### Saving Plans 
-> Contrato de 1 a 3 anos e custa bem mais barato, pois você dá a garantia de que ficará por esse período
-> A máquina fica sempre disponível no período acordado

### Dedicated Hosts
-> Máquina física para você usar
-> A vantagem é que você pode instalar suas licenças nela

## [Tipos de instâncias EC2 na AWS](https://aws.amazon.com/pt/ec2/instance-types/?trk=a5a8f3c9-c18a-485c-bbdb-52b795178fbe&sc_channel=ps&sc_campaign=acquisition&sc_medium=ACQ-P|PS-GO|Brand|Desktop|SU|Compute|EC2|BR|EN|Text&s_kwcid=AL!4422!3!536326960554!b!!g!!%2Baws%20%2Bec2%20%2Bcloud&ef_id=CjwKCAjwloCSBhAeEiwA3hVo_YKTQyE5jgSoILuBM6cvjAMsa7vgGYC6Waj9JrW2Uv_f5RkEk4shihoCaHsQAvD_BwE:G:s&s_kwcid=AL!4422!3!536326960554!b!!g!!%2Baws%20%2Bec2%20%2Bcloud) 
Cada VM fica dentro de uma categoria da AWS. Caso você precise de mais memória, pode usar o tipo Memory Optimized (r6g) ou se você quer uma máquina balanceada em recursos, pode ser usado o tipo General Purpose.


## EBS - Elastic Block Store e EFS - Elastic Files Store
São discos de armazenamento. HDD ou SSD. A diferença entre o EBS e o EFS é que no EBS eu aloco o espaço pré-determinado e não consigo vincular o mesmo disco em mais de uma máquina. Enquanto o EFS, eu não aloco o espaço pré-determinado, o espaço vai sendo alocado conforme a quantidade de arquivos colocados e também é possível vincular ele em mais de uma máquina.

## Security Group (Virtual Firewall)
Inbound - Regras de entrada
Outbound - Regras de saída
Stateful - Tudo que está saindo, pode entrar
O SG trabalha na camada 4 do OSI


## AWS WAF - Web Application Firewall
O WAF te ajuda a proteger API's, LoadBalancer, tudo que está na camada 7*.
WEB ACL - Cria uma lista de acessos
Rule - Por regras
Request - Por requisições

## AWS WAF - Camada 7* do Modelo OSI - [Open System Interconnection](https://cf-assets.www.cloudflare.com/slt3lc6tev37/3L6e3OwCgSWOxp79AJUzXs/824b114d630b1c6d9c1252efc2f00f95/osi-model-7-layers_ptBR.svg)

<img src="https://cf-assets.www.cloudflare.com/slt3lc6tev37/3L6e3OwCgSWOxp79AJUzXs/824b114d630b1c6d9c1252efc2f00f95/osi-model-7-layers_ptBR.svg">




