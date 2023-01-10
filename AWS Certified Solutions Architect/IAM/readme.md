# IAM - Identity Access Manager

[Documentação oficial IAM](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html)

É tudo que dá acesso à AWS, seja pelo console, por linha de comando (CLI) ou via API. 

Através do IAM é possível gerenciar: 
- USERS
- ROLES
- GROUPS
- FEDERATED USERS (TWITTER, FACEBOOK e ETC)
- APPLICATION 

Existem dois tipos de politicas a serem aplicadas: 
- IBP -> Identity Based Policy (baseada em usuários)
- RBP -> Resource Based Policy (baseada em recursos)

Primeiro passo para configurar o AWS CLI é rodar o seguinte comando:

``` aws configure sso ```