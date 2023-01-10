# AWS Certified Solutions Architect Associate
#### Este readme são anotações do curso do André Iacono na plataforma udemy 

</br>

##### Link: [Certificação Amazon AWS Solution Architect 2022 + 3 CURSOS](https://itau.udemy.com/course/certificacao-amazon-aws-2019-solutions-architect/learn/)


</br>

### Public Cloud X Hybrid Cloud X Private Cloud
Cloud pública nada tem a ver com ter seus serviços/infraestrutura exposto para toda e qualquer pessoa, apenas que todos os serviços são oferecidos a qualquer tipo de pessoa/público. Por isso o termo "público". 
Cloud privada você pode locar hacks físicos nos datacenters da amazon/google, isso te faz um custo maior, porém com um nível maior de segurança. 
Cloud híbrida é uma mescla das duas coisas, tanto você pode ter os hacks locados quanto serviços/infra na nuvem.

### Como funciona a infra da AWS
- Region
    - Availability zone
        - Outspots Colocation (São partes pequenas da AWS dentro de um grande datacenter)
        - Local Zone (Recursos limitados)
        - AWS WaveLength (Específicos para aplicações e tem latência muito baixa)


### Free Tier
Serviços gratuitos que são disponibilizados pela AWS afim de que o usuário/empresa teste e/ou estude os recursos. 
##### Confira aqui a lista dos serviços gratuitos** : [Serviços gratuitos AWS](https://aws.amazon.com/pt/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc&awsf.Free%20Tier%20Types=*all&awsf.Free%20Tier%20Categories=*all)

##### ** Atenção alguns serviços são gratuitos por tempo <b>limitado</b>.

</br>

### IAM - Identity and Acess Management 
#### Com este recurso é possível criar usuários e grupo de usuários para acessar serviços específicos. 

</br>

### MFA - Multifactor Authentication 
#### Autenticação de dois fatores, por exemplo com um google authenticator no celular.

</br>

### User Group
-> IAM > USER GROUP > CREATE USER GROUP > USER GROUP NAME > ADD POLICYS** 

** Policys são os recursos que aquele grupo terão acesso. 

Por exemplo, um grupo com usuários de INFRAESTRUTURA pode ter acesso à <b>AmazonEC2FullAccess</b> porque este é o recurso onde ficam as máquinas virtuais. 

</br>
<span style="color: pink">Existem dois tipos de usuários que podem acessar a AWS</span> </br>

- Usuário que consegue enxergar o CONSOLE da aws
- Usuário que acessa os serviços via ACESS_KEY/SECRET_KEY e aws-cli.

<b>Atenção!!</b> </br>
Uma vez perdido o ACESS_KEY/SECRET_KEY não tem como recuperar, só deletando e criando o usuario novamente.

</br>

### Billing
Nessa parte é possível você controlar e categorizar todos os seus gastos com os serviços. Você tem gráficos, previsões de gastos e também pode configurar limites para gastos. 

### Criando Budget
Limitar o valor a ser gasto na AWS, isso evita gastos desnecessários relacionados aos serviços utilizados. 

### S3
Aceita todo tipo de arquivo e até 5TB em um único arquivo.
- Storage Class
    - Quando você tem um arquivo que precisa acessar frequentemente, automaticamente o valor do armazenamento é mais caro.
    - Arquivos de backups podem ser armazenados em storage class mais barato. 

Para conferir tudo sobre storage class [clique aqui](https://aws.amazon.com/pt/s3/storage-classes/).

## !! IMPORTANTE SABER !!
### Você pode calcular o valor dos serviços que fará uso antes mesmo de começar a utiliza-los através da calculadora da AWS. Assim fica fácil fazer uma estimativa de gastos. 

Para conferir a calculadora AWS [clique aqui](https://calculator.aws/#/).


### ACL x Security Group
- ACL -> é statefull que é uma forma dar permissão e bloqueio para determinadas coisas
- Security Group -> é stateless ele dá permissão à determinada coisa e bloqueia todo o resto, não deixando de forma dinâmica


Amazon EBS - Designed to support block storage volumes with Amazon EC2 instances

Amazon EFS - Designed as a native Multi-AZ file system for NFS file shares

Amazon FSx for Lustre - Designed for distributed high performance computing workloads

Amazon S3 - Designed to support millions of storage objects and accessed using REST APIs

Amazon FSx for Windows File Server - Designed to support SMB file shares in a Single-AZ or Multi-AZ configuration