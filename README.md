# Incentivale v3 Ruby SDK
> Gem para integrar com a API v3 da incentivale.com.br

[![Gem Version](https://badge.fury.io/rb/incentivale-sdk-ruby.svg)](https://badge.fury.io/rb/incentivale-sdk-ruby)

**Índice**

- [Instalação](#instalação)
- [Configurando a autenticação](#configurando-a-autenticação)
- [Exemplos de Uso](#produtos):
  - [Produtos](#produtos)
    - [Listagem](#listagem)
  - [Resgates](#resgates)
    - [Criação](#criação)
    - [Consulta](#consulta)
  - [Tracking do pedido](#tracking-do-pedido)
  - [E-gift](#e-gift)
    - [Verificar disponibilidade](#verificar-disponibilidade)
    - [Transação](#transação)
- [Documentação](#documentação)
- [Licença](#licença)

## Instalação
Adicione a seguinte linha no seu Gemfile:
```ruby
gem 'incentivale-sdk-ruby', require: 'incentivale'
```
Depois, rode o `bundle install`.

## Configurando a autenticação
Crie o arquivo `incentivale.rb` no caminho 'config/initializers' com os dados para autenticação com a sua conta:
```ruby
Incentivale.configure do |config| 
  config.username = 'usuario@email.com' # Substitua pelo seu username de login
  config.password = 'senhaXXX' # Substitua pelo sua senha de login
  config.campaign = '02a3e18d37174beb93665dd40f11d106' # Substitua pelo seu token de identificação da campanha
  config.environment = :sandbox # Substitua pelo ambiente desejado (:sandbox / :production)
end
```

## Produtos
### Listagem
Serviço responsável em identificar os produtos do catálogo, negociado anteriormente junto ao comercial da Incentivale. Todos os produtos são identificados pelo SKU.
```ruby
products = Incentivale.products.all
```

## Resgates
### Criação
Serviço responsável em enviar o resgate do pedido - Cartão físico, virtual, recarga, pague contas e cartão pré-pago.
```ruby
redemption = Incentivale.redemption.create({ 
    cod_request: '45214',
    sku: 'CPVEX045V200',
    name: 'João de souza',
    cpf_cnpj: '045125478555',
    email: 'joao@teste.com',
    address: 'Rua frederico jorge',
    address_number: '1255',
    complement: 'Bloco A',
    district: 'Centro',
    city: 'Blumenau',
    state: 'SC',
    cep: '8978858',
    phone_contact: '4785552544',
    date_register: '2017-05-12',
    amount_premium: '3',
    price_premium: '',
    pay_bill_barcode: '',
    pay_bill_value: '',
    code_card: '' 
})
```

### Consulta
Serviço responsável em identificar pedido do lote.
```ruby
cod_request = 45214 # Controle do cliente
order = Incentivale.redemption.find(cod_request)
```

## Tracking do pedido
Serviço responsável em identificar cada pedido individualmente, todos os pedidos acima de 3 (três) itens são enviados em lote. 
Ex: Pedido XXX com 5 itens = (Lote um - 2 itens / Lote dois - 3 itens)
```ruby
cod_request = 45214 # Controle do cliente
tracking = Incentivale.tracking.find(cod_request)
```

## E-gift
### Verificar disponibilidade
Serviço responsável em verificar disponibilidade do produto em estoque.
```ruby
sku = 'CPVMO083V50'
amount = 2
availability = Incentivale.egift.available?(sku, amount)
```
### Transação
Serviço responsável em efetivar o E-gift.
```ruby
egift = Incentivale.egift.create({
    cod_request: '4588',
    sku: 'CPVMO083V50',
    amount_premium: '2',
    name: 'João da silva',
    cpf_cnpj: '23432234234',
    email: 'joaodasilva@gmail.com' 
})
```

## Documentação	
[Documentação oficial](https://central.incentivale.com.br/apiv3)

## Licença
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
