## CLOUD FRONT - CONTENT DELIVERY NETWORK 

O principal objetivo do cloud front é replicar o dado para uma AZ mais próxima de você.

Por exemplo, eu amarzeno um arquivo/video/websites estáticos ou qualquer coisa na AZ do Brasil, uma pessoa acessando esse mesmo arquivo de uma AZ mais distante, por exemplo, no Canada, vai ter um delay na primeira vez, a partir da segunda vez, esse arquivo já estará em cache e irá carregar muito mais rápido. 


> Texto abaixo foi retirado do curso do André Iacono na plataforma Udemy

## Leitura Rápida - Sobre o CloudFront
O que é o Amazon CloudFront?

O Amazon CloudFront é um serviço da web que acelera a distribuição do conteúdo estático e dinâmico da web, como arquivos .html, .css, .js e arquivos de imagem, para os usuários. O CloudFront distribui seu conteúdo por meio de uma rede global de datacenters denominados pontos de presença. Ao solicitar um conteúdo que você está veiculando com o CloudFront, o usuário é roteado para o ponto de presença com a menor latência (atraso de tempo) para que o conteúdo seja fornecido com o melhor desempenho possível.

Se o conteúdo já estiver no ponto de presença com a menor latência, o CloudFront o entregará imediatamente.

Se o conteúdo não estiver nesse ponto de presença, o CloudFront recuperará de uma origem que você definiu—como um bucket do Amazon S3, um canal do MediaPackage ou um servidor HTTP (por exemplo, um servidor web), que você identificou como a fonte para a versão definitiva do seu conteúdo.

Por exemplo, suponha que você esteja exibindo uma imagem de um servidor web tradicional, e não do CloudFront. Por exemplo, você pode fornecer uma imagem, sunsetphoto.png, usando a URL http://example.com/sunsetphoto.png.

Seus usuários podem navegar facilmente para esse URL e ver a imagem. Mas provavelmente não sabem que sua solicitação foi roteada de uma rede para outra—por meio do conjunto complexo de redes interconectadas que compõem a Internet—até a imagem ser encontrada.

O CloudFront acelera a distribuição do seu conteúdo encaminhando cada pedido de usuário por meio da rede backbone da AWS para o ponto de presença que veicule melhor seu conteúdo. Normalmente, esse é um servidor de ponto do CloudFront que fornece a entrega mais rápida ao visualizador. Usar a rede da AWS reduz drasticamente o número de redes pelas quais as solicitações dos usuários devem passar, melhorando o desempenho. Os usuários obtêm menos latência—o tempo que leva para carregar o primeiro byte do arquivo—e taxas de transferência de dados maiores.

Você também pode obter mais confiabilidade e disponibilidade porque as cópias de seus arquivos (também conhecidos como objetos) agora são mantidos (ou armazenados em cache) em vários pontos de presença em todo o mundo.


## Criando uma distribuição 

- Web 
    - Esta distribuição é usada para armazenar site estáticos e/ou dinâmicos e live streaming
- RTMP
  - Esta distribuição é usada para armazenar mídias (fotos, videos, audios)

