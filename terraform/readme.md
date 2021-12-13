### Coisas para serem lembradas sempre ### 
- Cada imagem tem um ID diferente
- Imagem dentro da AWS é IAM
- Cada região tem sua imagem, o que quer dizer que não posso usar o mesmo ID para duas regiões distintas
- Posso importar uma chave pública dentro da própria AWS

</br>
</br>

#### Comando para gerar uma chave publica

```ssh-keygen -f <nome-da-chave-a-ser-gerada> -t rsa ```

</br>
</br>

O comando init inicia o terraform
```terraform init ```

Este comando mostra as configurações que você quer fazer
``` terraform plan ```

Este comando executa as configurações
``` terraform apply ```

O comando show lê o arquivo terraform.tfstate e exibe as informações associadas (IP, rede, etc). 

``` terraform show ```