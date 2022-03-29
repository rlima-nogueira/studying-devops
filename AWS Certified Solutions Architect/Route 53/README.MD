# Route 53
Serviço AWS para DNS - Domain Name Service

-> Recurso global da AWS

-> Responsável pela resolução do enderaçamento IP
-> Redundância de todas as localizações
-> 100% de SLA (Availability)
-> Geo, Failover - se um servidor falhar você pode redirecionar para outro.

7 Tipos de registros
- Host-A (A ou AAAA)
    - A -> IPV4
    - AAAA -> IPV6

- Alias (CNAME)
    - O alias é como um alias mesmo, ele sempre aponta para um HOST-A.

- Mail Exchange (MX) 
    - Os e-mails serão encaminhados para esse servidor

- Service Record (SRV)

- Start of Authority (SOA)

- Name Server (NS)

- Pointer (PTR)
    - Funciona como ferramenta de reverse, se eu der o IP final, ele me dá o IP que consultou

## Routing Policy

### Simple Routing Policy
    - De forma randômica, envia o endereçamento IP para o host e o host armazena na sua entrada de DNS, no seu cache aquele endereçamento IP para o servidor. 

### Failover Routing Policy
    - Primary Server - Servidor principal, todas as requisições iram para ele, caso ele caía, joga as requisições para o Secondary Server e assim por diante.

### Geolocation Routing
    - Você disponibilizar o site de acordo com o local que a pessoa está acessando. Por exemplo, tenho dois servidores um em SP e outro no EUA, pessoas de SP acessarão o servidor do BR e as pessoas do EUA acessarão o servidor dos EUA.

### Geoproxymity Routing (Traffic flow only) Routing
    - Pode identificar por onde o tráfego esta passando e colocar regras no meio do caminho. Os usuários de uma região pode acessar um determinado servidor, caso aquele servidor caia, ele irá acessar outro servidor. Pode-se aplicar várias policys dentro de um unica policy.

### Latency Routing Policy
    - Armazena o calculo entre a requisição do usuario final até o servidor. Ou seja, ele acessa sempre o servidor mais proximo. Fazendo a latência ser mais baixa.

### Multivalue Answer Routing Policy
    - Quando você adiciona o Health Check ao Simple Routing, ele se torna o Mutlivalue Answer.


### Weighted Routing Policy
    - O quanto de trafego esta sendo enviado para cada servidor, por exemplo se você tiver 3 máquinas, você pode mudar o peso das requisições de cada um. Maquina 1 - Recebe 50% das requisições, Maquina 2 - Recebe 40% e a Máquina 3 - Receberá 10% das requisições.