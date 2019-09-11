## Roda & Sequel

Project for Roda studies

### Installing Ruby

[Github](https://github.com/ruby/ruby)

With `rbenv`:

```bash
$ export RUBY_VERSION=`cat .ruby-version`
$ rbenv install $RUBY_VERSION
```

### Running the project

```bash
$ rbenv gemset create $RUBY_VERSION roda-sequel # if you use rbenv with gemset plugin
$ gem install bundler -v 1.17.3
$ bundle install
$ rackup # Then visit http://localhost:9292
```

### TODO

[ ] Verify how to do proper caching  
[ ] Finish `seeds.rb` code 
[ ] Create rake task to run `seeds.rb` code
[ ] Adjust healthcheck model implementation
[ ] Add tests with rspec
