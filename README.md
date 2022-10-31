# Guide Stock!

Aplicativo de busca e apresentação de cotações da bolsa de valores.

O aplicativo foi desenvolvido em Flutter/Dart, acessando API do Yahoo Finance.

**Arquitetura**

Na implementação foi utilizada Clean Architecture e também separando packages, facilitando assim a manutenção e reuso do código.

**Checklist do desenvolvimento**

 - [x] Estrutura em packages
 - [x] Clean Architecture
 - [x] Busca de cotações
 - [x] Apresentação do resultado das cotações em tabela
 - [x] Apresentação do resultado em gráfico (parcial)
 - [ ] Testes unitários
 - [ ] Testes de widget
 - [ ] Testes de integração

**Dependência de pacotes de terceiros**

 - intl
 - get_it
 - equatable
 - dio
 - flutter_bloc
 - candlesticks

**Funcionalidades**

Busca de cotações

![enter image description here](https://maisrenda.com.br/busca.jpg)

A busca das cotações são efetuadas informando o código da empresa e o período em dias.
Ao entrar na tela, uma busca é automaticamente efetuada comas informações já informada nos campos, podendo usuário fazer as alterações de código e período que lhe convier.

É possível visualizar as informações buscadas em tabela e gráfico acessando os respectivos botões na tela.

Tabela de cotações

![enter image description here](https://maisrenda.com.br/tabela.jpg)

Na tabela de cotações, é apresentada a listagem apurada das informações buscadas contendo a data, o valor de fechamento, o percentual diário e o percentual acumulado no período.

Gráfico

![enter image description here](https://maisrenda.com.br/grafico.jpg)

Na tela de gráfico, os dados são apresentados em formato de candles, ilustrando os valores: máximo, mínimo, abertura, fechamento e volume.

> Apesar dos valores estarem corretos, o gráfico não está mostrando efetivamente os dados como diários, e sim como horários. Próximo passo é usar um outro gráfico mais efetivo que já foi implementado em outro projeto mostrando corretamente o gráfico e incluindo indicadores, como mostrado na tela abaixo. (no curto espaço de tempo para implementa, este acima foi o possível).

![enter image description here](https://maisrenda.com.br/grafico2.jpg)
