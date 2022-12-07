# ActiveService

Padroniza:
  - Como o service deve ser chamado e seus parâmetros;
  - A forma como é elaborada a regra de negócio
  - O formato/tipos das respostas dos services


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_service'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install active_service

## Usage

  - Como o service deve ser chamado e seus parâmetros;
    - Através dos métodos `perform` e `perform!` da classe `Base`, é possivel instanciar um novo objeto e inicializar a execução do serviço. O método `perform!` executa a operação e não falha graciosamente. O método `perform!` faz um rescue de erros e inicializa um objeto do tipo `Response` com as mensagens dos erros capturados.

  - A forma como é elaborada a regra de negócio
    - Classes que herdam a classe `Base` devem implementar uma sobrescrição do método `perform`.

  - O formato/tipos das respostas dos services
    - A classe `Response` define o método `response` que recebe um hash e inicializa as chaves como atributos de um objeto. Esta `Response` encapsula a responsabilidade de serialização de erros e serialização da resposta que o serviço retornará.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/active_service. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActiveService project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/active_service/blob/master/CODE_OF_CONDUCT.md).
