# Benefícios Service
Serviço para gerenciamento de benefícios.

## Créditos
Responsáveis pelo desenvolvimento desse projeto.

@danilo.barion

## Dependências

Para o ambiente de desenvolvimento e testes você vai precisar de:

* [rvm](https://rvm.io/) ou [rbenv](https://github.com/rbenv/rbenv)
* [Ruby 2.6](https://www.ruby-lang.org/pt/)
* [Bundler](http://bundler.io/)
* [Docker](https://www.docker.com/)
* [docker-compose](https://docs.docker.com/compose/)
* [PostgreSQL](https://www.postgresql.org/download/)

## Setup da aplicação

```bash
$ bundle
```

## Execução da aplicação

Se for subir a aplicação apontando para o banco local, executar os seguintes comandos:

```bash
$ docker-compose up -d database
$ RACK_ENV=development bundle exec rake db:setup
```

> Cuidado ao executar comandos de banco de dados quando estiver apontando para o ambiente de QA/Produção, pois estes podem gerar perda de dados ou inconsistências diversas.

Executando a aplicação:

```bash
$ rerun "rackup -p 3000"
```

## Testes

A dependência para rodar os testes é o PostgreSQL. Para rodar uma instância dele execute o comando:

```
docker-compose up -d database
```

### Preparando o ambiente de testes

Para rodar os testes é preciso criar o banco de dados com as tabelas e informações necessárias.
Se estiver rodando o banco com docker, as configurações do arquivo `.env` devem
ser iguais a do arquivo `.env.test`.

Execute o comando:

```bash
$ RACK_ENV=test bundle exec rake db:setup
```

Isto irá criar o banco, rodar as migrations e popular com as informações iniciais.

### Executando os testes

Os testes podem ser executados com o comando `bundle exec rspec`.

### Cobertura dos testes

Para saber como está a cobertura dos testes, ao final da execução dos testes,
o relatório de cobertura estará na pasta **coverage/**.
Basta abrir o arquivo **coverage/index.html** no seu navegador.

## Dev Tools

Para facilitar a execução de alguns comandos padrão e também
o setup do banco de dados, foram criadas algumas rake tasks.

- Para listar as tasks disponíveis, use o comando `bundle exec rake -T`

Além disso, existem alguns scripts na pasta `bin`, para uso durante o desenvolvimento,
como um console do Sequel.

- Para executá-los basta rodar `bin/<comando>`

## Estilo, qualidade e documentação de código

O projeto conta com algumas ferramentas para execução dos testes e estilos de código.
É importante manter o estilo de código conforme descrito no [Handbook VAGAS](https://bitbucket.org/vagas/handbook).

### Estilo de código

A verificação de estilo de código é feita com as regras do [Rubocop](http://batsov.com/rubocop/), basta utilizar o comando:

```bash
$ bundle exec rubocop
```

Caso seja identificada alguma ofensa, é possível executar o comando `rubocop -a` para que este realize a auto-correção do que for possível.
Se ainda houver ofensas, deverão ser corrigidas caso a caso.

### Qualidade de código

A verificação da qualidade geral do código é feita conforme as regras do [Rubycritic](https://github.com/whitesmith/rubycritic/). Para gerar uma avaliação, basta utilizar o comando:

```bash
$ bundle exec rake dev:rubycritic
```

Será aberta uma janela do navegador, com a porcentagem indicando a qualidade do código, com todos os detalhes para análise e refatoração.

### Documentação do Código

Para atualizar a documentação gerada pelo Yard, executar:

```bash
$ bundle exec rake dev:yard
```

Após a criação, no endereço `http://localhost:8808/` será possível navegar pela documentação.

Veja [aqui](http://www.rubydoc.info/gems/yard/file/docs/GettingStarted.md) mais detalhes sobre como 
usar o Yard para documentar seu código.

## Contribuição
1. Clone o projeto!
2. Crie sua feature branch: `git checkout -b my-new-feature`
3. Commit suas mudanças: `git commit -am 'Add some feature'`
4. Envie seu branch para o repositório: `git push origin my-new-feature`
5. Envie um Pull Request :D
