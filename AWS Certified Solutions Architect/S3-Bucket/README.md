# S3 BUCKET
### Armazenamento de arquivos 

- O S3, no momento da criação, ele é global;
- O nome do bucket deve ser único de forma global;
- No momento da criação do bucket, você pode definir se ele terá acesso publico ou restrito;
- Escolhemos a região na hora da criação do bucket;
- Existe a possibilidade de copiar a configuração de uma bucket que já está criada;
- Toda vez que é feito um upload, é bom realizar o refresh pelo botão próprio para isso;
- O bucket cobra por download e não por upload;

## Por padrão, o upload é sempre feito no Storage Class Standard. 

### É Possível alterar o storage class na hora do upload do arquivo e também depois que o upload foi feito, porém a cada vez que você faz essa troca de storage class, você será cobrado. 

</br>

## Permissões ao Bucket S3
Temos as permissions e os acls (acess lists), quando você deixa as permissions publica, o seu bucket é protegido por um ACL e seus arquivos por outro ACL, ou seja, mesmo que o seu bucket esteja público, o acesso aos seus arquivos não estarão. 

Preciso definir uma lista de acessos (ACL) para o bucket. 

Com o S3 é possível fazer o versionamento dos arquivos, caso um arquivo seja excluído, alterado ou qualquer coisa do tipo, é possível buscar as versões anteriores. Isso acaba encarecendo o armazenamento, visto que para cada versão do arquivo, ele ocupa X valor de espaço. Então caso o arquivo tenha 10 megas e tenhamos 10 versões dele, estaremos ocupando 100 megas somente com um arquivo.
O mesmo ocorre quando deletamos um arquivo, o armazenamento continuará o mesmo, visto que o versionamento possui a característa de guardar o arquivo com a tag de "Delete marker". Caso remova essa tag, o arquivo voltará a ficar disponível para o usuário. Para deletar este arquivo em definitivo, é necessário deletar a a tag junto com todas as versões disponíveis. 

!!! ATENÇÃO !!! Uma vez que o versionamento foi habilitado, você não pode mais desabilitar, apenas suspender o uso. 

## Lifecycle Manager
Com essa opção, é possível gerenciar o ciclo de vida dos seus arquivos. Por exemplo, podemos escolher guardar somente as versões mais novas dos arquivos. As ultimas versões. Ou sempre o mais recente. Ou então alterar o storage class onde as versões mais antigas estão sendo armazenadas, fazendo assim o custo diminuir. 

- Antes de realizar essa mudança de storage class, precisa levantar quanto isso irá custar. Lembrando que toda vez que um arquivo já está armazenado em uma storage class e você move ele, acaba-se pagando por isso. 

- Quando definimos um tempo específico par ao arquivo ser removido, por exemplo: guarde as versões dos arquivos dos ultimos 30 dias e no dia 31, quando o arquivo for deletado, não há como restaurá-lo. É importante deixar claro essa politíca de exclusão.
