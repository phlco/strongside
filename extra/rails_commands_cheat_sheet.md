# Resources

- [api.rubyonrails.org:](api.rubyonrails.org) The best place to get detailed documentation on rails
- [Rails Guides](http://guides.rubyonrails.org/v3.2.13/): A great place to learn more about various other features of rails.

# Basic Rails Commands

### Create a new Rails App that runs Postgres

```
$ rails new your_app_name -d postgresql
```

and if you have rails 4 installed

```
rails _3.2.3_ new your_app_name -d postgresql
```

### Remove 
```
public/index.html
```

### Completely replace your `database.yml` with
[database.yml](https://gist.github.com/jonleung/e21811c22d4c38247654/)

### Adding to the end of the your Gemfile
Add the gems from the file *AT THE END* of your Gemfile [from this gist](https://gist.github.com/jonleung/f98123abe27ca0a42d04/).

### Install RSpec

```
rails generate rspec:install

# this creates
#	- creates the '.rspec' config file
#	- creates the 'spec' folder
#	- creates the 'spec/spec_helper.rb'
```

### Initializing your Guardfile

```
bundle exec guard init rspec
#	- create the 'Guardfile'
```

### Running Guard
```
bundle exec guard
```

## DB Related Rake Tasks
---

### Create the 'development' and 'test' Databases

```bash
$ rake db:create
```

### Destroy A Database
At a later point, you can destroy your database.

```bash
$ rake db:drop
```

### Create a migration

```bash
$ rails g migration name_your_migration_what_it_does
```

### Migrations

```
# 20131016155903_create_programmers.rb

class CreateProgrammers < ActiveRecord::Migration

  def up
    create_table :programmers do |t|
      t.string :name
      t.string :twitter_username
      t.string :twitter_image
      t.string :github_username
      t.timestamps
    end
  end

  def down
  end

end
```

### But models are usually more convienient

```
rails g model machine candy:integer money:float location:string owner_id:integer candy_price:float
#      invoke  active_record
#      create    db/migrate/20131122125908_create_machines.rb
#      create    app/models/machine.rb
#      invoke    rspec
#      create      spec/models/machine_spec.rb


rails g model owner money:float candy:integer
#      invoke  active_record
#      create    db/migrate/20131122125959_create_owners.rb
#      create    app/models/owner.rb
#      invoke    rspec
#      create      spec/models/owner_spec.rb
```

### Run any unrun migration files

```
$ rake db:migrate # migrates your development db
$ RAILS_ENV=test rake db:migrate # migrates your test db
```

Start your rails server

```bash
$ rails s # starts your development server
$ RAILS_ENV=test # starts your test server
```

Interactive Rails Console

```bash
$ rails c # starts your development console
$ rails c # starts your test console
```

## Filename Conventions
Model names are singular `dog.rb`

if there is a controller for a model it is pluralized
`dogs_controller.rb` and in the controller file it's `class DogsController < ApplicationController`

Controller names should map to a subfolders inside of Views with the same names.


## Basic Flow

- The Browser makes a request
- The Web Server takes the request and sends it to the Rails App
- The Router reads the request and calls the appropriate Controller and Action
- The Controller retrieves data from the Model and sends it to the View
- The View generates the HTML with the Model data
- The Web Server takes the completed HTML and sends it to the browser
- The Broswer displays the response from the Web Server
