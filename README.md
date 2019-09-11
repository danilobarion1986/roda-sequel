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

[X] Verify how to use zeitwerk for constant auloload
[X] Finish `seeds.rb` code 
[X] Create rake task to run `seeds.rb` code
[X] Adjust healthcheck model implementation
[X] Add tests with rspec
[ ] Verify how to do proper caching  
[ ] Verify how to organize app code
[ ] Improve rake tasks for DB, using [this article ideas](https://mrcook.uk/simple-roda-blog-tutorial)
