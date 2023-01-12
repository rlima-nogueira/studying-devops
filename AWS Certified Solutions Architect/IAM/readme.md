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

Quando falamos de ROLES, na maioria das vezes, estamos falando de conceder acesso a serviços para acessar outros serviços.
Quando falamos de POLICYS, na maioria das vezes, estamos falando de conceder acesso a grupos de usuários ou a usuarios para acessar determinados serviços.

## Estrutura de uma POLICY

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "S3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        },
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "arn:aws:s3:::MY_BUCKET"
            "Resource": "arn:aws:s3:::MY_BUCKET/*"
        }
    ]
}
```
A policy é sempre lida de cima para baixo em sequência. Nesse caso, estamos dando permissão para todos os buckets pegar a localização e listar todos, em seguida, colocamos a condição para isso acontecer em buckets específicos.


Primeiro passo para configurar o AWS CLI é rodar o seguinte comando:

``` aws configure sso ```