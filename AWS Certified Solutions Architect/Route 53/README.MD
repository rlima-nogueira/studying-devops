# Route 53
Serviço AWS para DNS - Domain Name Service

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

