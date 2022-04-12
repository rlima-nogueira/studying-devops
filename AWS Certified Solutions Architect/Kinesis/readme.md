# Kinesis

Utilizado para armazenar dados de streaming
-> Site -> Pedidos -> Transações
-> Games -> Jogadores
-> Uber -> Driver, Pass, Rotes
-> Videos -> Quantidades de visualizações, quanto tempo
-> Audios 

Funciona como um PRODUCER/CONSUMER

Temos 3 tipos
    - Streams (Armazena entre 24h a 7 dias)  1 shad (partes) - 5 transações por segundo e no máximo 2 megas por segundo. 
    - Firehose não tem armazenamento, produz, consome e o dado some
    - Analytics - Faz a análise de tudo. 