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