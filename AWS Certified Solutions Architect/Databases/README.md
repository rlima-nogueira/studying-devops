# AWS Databases

## Relational Database e Non-Relational
- Multi-AZ  
    - Ele mantém o mesmo DNS, caso o serviço caia, ele sobe uma nova instância com a replica indetica. 
    - Disaster recovery
        -> Se eu perder uma database, a outra sobe e o serviço não para.
- Multi-Replica
    - Tem o DNS diferente, caso um DB caia, a aplicação fica sem DB até que você aponte para o DNS da replica
    - Cópia
        -> Faz uma cópia da database atua para outra database e essa cópia vai ser idêntica. 


## Relational Database
    - RDS

## Non-Relational
    - DynamoDB
        - Latência muito baixa
        - Key/Value
        - Armazenamento em SSD
        - Consistent Read -> Acesso MAIOR que 1 segundo entre leitura e escrita
        - Strongly Consistent Reads -> Acesso MENOR que 1 segundo entre leitura e escrita


## Elasticache
    - Rápida criação, operação e escalibidade 
    - Não é utilizado discos
    - In-Memory cache -> amarzena em memória (processamento -> memória)
    
    - Dois tipos de elasticache
        - Memcache - armazena em objetos 
        - Redis - armazena em key/value 
            - Somente o redis pode ter Multi-AZ

## Redshift
    - Warehouse 
        - Esse database serve mais para estoques
        - Armazena as coisas em coluna, isso agiliza a leitura (read)
        - Ele já inicia com 160GB
        - Compressão de dados
    - 2 tipos
        - Single mode -> 1 instância só de db
        - Compute model -> Até 128 instâncias de db
    - MPP - Massive Paralel Progressive
    - Não é MULTI-AZ

## Aurora
    - Criado em 2014
    - Compatível com o mySQL-ORACLE
    - 5x mais rápida que qualquer outra database dentro da aws
    - 10x mais barata que outras databases
    - Default 10GB
    - Autoscaling automatico
    - 1 banco de dados 64TB
    - Pode ter até 15 replicas 
    - Latência muito baixa 
    - Recover - Point-In-Time (Recuperação de arquivo em dia, horas, segundos)
    - Backup contínuo e pelo menos 3 zonas
    