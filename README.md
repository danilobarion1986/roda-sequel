## JRuby, Roda & Sequel

Project for JRuby & Roda studies 

### Installing JRuby

[Getting Started](https://github.com/jruby/jruby)

With `rbenv`:

```bash
$ export JRUBY_VERSION=9.2.7.0 # Use the version of JRuby that you want
$ rbenv install jruby-$JRUBY_VERSION
```

Then, export the necessaries environments variables, as described in this StackOverflow [question](https://stackoverflow.com/questions/36324666/error-could-not-find-or-load-main-class-org-jruby-main).

### Installing the JDK

For Arch Linux and its derivatives, follow this [instructions](https://www.edivaldobrito.com.br/oracle-java-no-arch-linux/)


### Running the project

```bash
$ echo jruby-$JRUBY_VERSION > .ruby-version
$ rbenv gemset create jruby-$JRUBY_VERSION jruby-roda-sequel # if you use rbenv with gemset plugin
$ jgem install bundler
$ bundle install
$ rackup # Then visit http://localhost:9292
```
