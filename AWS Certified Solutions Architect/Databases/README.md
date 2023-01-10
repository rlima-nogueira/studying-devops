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
    - Default 10GB
    - Autoscaling automatico
    - 1 banco de dados 64TB
    - Pode ter até 15 replicas 
    - Latência muito baixa 
    - Recover - Point-In-Time (Recuperação de arquivo em dia, horas, segundos)
    - Backup contínuo e pelo menos 3 zonas


## Family Snow
The Snow Family is composed of AWS Snowcone, AWS Snowball, and AWS Snowmobile. Each device is designed to meet the unique compute and capacity challenges required by different use cases. These services help physically transport up to exabytes of data into and out of AWS. AWS owns and manages AWS Snow Family devices. The devices integrate with AWS security, monitoring, storage management, and compute capabilities. 

The AWS Snow Family offers three classifications of data transfer and edge computing solutions to solve different levels of challenges:

AWS Snowcone - A small, rugged, portable, secure edge computing, storage, and data transfer device.
AWS Snowball - A rugged petabyte-scale data transport device with onboard storage and compute capabilities. AWS Snowball has different models of AWS Snowball Edge devices to choose from.
AWS Snowmobile -  A large truck to migrate or transport exabyte-scale datasets into and out of the AWS Cloud. 


## Amazon FSx File Gateway
Amazon FSx File Gateway is used to work with your Windows-based applications and workflows. Amazon S3 File Gateway supports SMB and Network File System (NFS) protocols while storing your files as Amazon S3 objects.
    
## Volume Gateway
Volume Gateway makes copies of your local block volumes and stores them in a service-managed Amazon S3 bucket.

## S3 File Gateway
Amazon S3 File Gateway connects on-premises NFS and SMB file shares to customer-managed Amazon S3 object storage. 

## Snowball Edge Storage
You can order AWS Snowball Edge devices with compute capabilities as a cluster to increase durability and compute  processing capabilities. You can order clusters for local compute and storage only jobs. The Snowball Edge device must have compute capabilities. AWS Snowcone devices are not available in a cluster configuration.


## AWS Storage services are available for local storage on AWS Outposts
Amazon EBS is natively available on all AWS Outposts implementations. You can include Amazon S3 in your Outposts configuration. As of this writing, other AWS Storage services are not available as local services on Outposts.

## Amazon FSx for Lustre
Amazon FSx for Lustre is designed for high performance computing environments. You can service thousands of compute instances and serve millions of IOPS of performance.

## CloudEndure Migration
uses Amazon EC2 instances and Amazon EBS volumes. CloudEndure Migration copies and updates in real time your operating systems, applications, and data from your on-premises application servers to the AWS Cloud. CloudEndure first stages your application using low-cost EC2 instances and EBS volumes. When you are ready to migrate to the AWS Cloud, the low-cost EC2 instances and EBS volumes are upgrade to production level EC2 instances and EBS volumes.