# TDD Eample
* [System Dependencies](#system_dependencies)
* [Getting Started](#getting_started)
* [Run Test](#run_test)

## <a name="system_dependencies"></a>System Dependencies
* Ruby 2.3.3
* Rails 4.2.7.1
* Postgresql 9.4 up

## <a name="getting_started"></a>Getting started
* Setting up database
``` bash
$ cp config/database.yml.example config/database.yml
```

* Setting up ENV
``` bash
$ cp config/application.yml.example config/application.yml
```

## Run Test
* Use rspec to run spec
 ``` bash
 $ bundle exec rspec spec/
 ```

### Note
* Cannot use ruby lastest stable (2.4.0) 
because it not completable with rails 4.2.7.1(latest stable version)
