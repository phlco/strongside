# Learning Objectives

Define Continuous Integration as it relates to the Development Process

#Setting up Capybara

Capybara simulates user behavior. 

How to integrate: 

Add `rspec-rails` and `capybara` to your Gemfile's development and test groups

```
# Gemfile
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
end
```

Run `rspec:install`

```
$ rails g rspec:install
```

Add `require 'capybara/rails'` to your `spec_helper.rb`

```
# app/spec/spec_helper.rb
...
require 'rspec/autorun'
require 'capybara/rails' # added
```

Feature specs are high-level tests meant to exercise slices of functionality
through an application. They should drive the application only via its
external interface, usually web pages.

We'll put our specs in a `spec/features` folder.
Create a folder called `features` under `spec`

Remember to add `require 'spec_helper'` to your features specs!

With feature specs you should drive all interaction through the browser and use methods like `visit` and `click_on`.

Run your tests with `rspec`

```
$ bundle exec rspec
```

# Testing with JavaScript

We need to add Selenium-Webdriver to our gemfile and rebundle

```
group :development, :test do
    gem 'rspec-rails'
    gem 'capybara'
    gem 'selenium-webdriver'
end
```

We have to make our tests as requiring JavaScript

```
scenario "user enters valid data", js: true do
    fill_in :title, with: "SOS"
    fill_in :body, with: "Save Our Ship"
    click_button "Add Message"
    # message = page.find('p', :text => "Save Our Ship")
    # expect( message ).to be_visible
    expect( page ).to have_css ".bottle"
end
```

# Pushing to Travis

gem install travis-lint

Create a `.travis.yml` file

```
language: ruby
rvm:
  - 2.1.0
before_script:
  - "sh -e /etc/init.d/xvfb start"
  - "export DISPLAY=:99.0"
  - "export JASMINE_SPEC_FORMAT=documentation"
env:
  - PG_USERNAME='postgres'
script:
  - "bundle exec rake db:create"
  - "bundle exec rake db:migrate RAILS_ENV=test"
  - "bundle exec rake spec"
  - "bundle exec rake jasmine:ci"
```

# Vocab

*continuous integration*

Continuous integration (CI) is the practice, in software engineering, of merging all developer working copies with a shared mainline several times a day

*build*
Your project cloned and build on travis

*Webhook*
is a method of augmenting or altering the behavior of a web page, or web application, with custom callbacks.

# Continuous Integration with Travis CI

Travis CI allows us to run tests on our builds everytime we push to github. This is very useful in group settings where we can run tests against pull requests or easily display the current status of a project.

##First

Signup on `https://travis-ci.org/` and link your account with github.


##Once your app is on github

Create a `.travis.yml` file in your app's main folder with the scripts we want to run

```
# .travis.yml
language: ruby
rvm:
  - 2.1.0
```

Travis makes a new build of our App on Travis CI, therefore we'll need to run all the commands that we run locally on Travis to get set up.

```
# .travis.yml
script:
  - "bundle exec rake db:create"
  - "bundle exec rake db:migrate RAILS_ENV=test"
  - "bundle exec rspec"
```

We want to ensure they're run from the context of the current bundle, so the rails commands should be prefaced with `bundle exec`

PostgreSQL is started on boot, binds to `127.0.0.1` and requires authentication with "postgres" user and no password.

Our `database.yml` file has `username` set to an environmental variable. 

```
# database.yml
username: <%= ENV['PG_USERNAME'] %>
```

To ensure that runs properly on Travis we need to add environmental variables to the Travis environment.

```
# .travis.yml
env:
  - PG_USERNAME='postgres'
``` 

If we want to run tests that require a Web browser

You can run test suites that require GUI (like a web browser) on Travis CI. The environment has xvfb (X Virtual Framebuffer) and Firefox installed. Roughly speaking, xvfb imitates a monitor and lets you run a real GUI application or web browser on a headless machine, as if a proper display were attached.

```
# .travis.yml
before_script:
  - "sh -e /etc/init.d/xvfb start"
  - "export DISPLAY=:99.0"
  - "export JASMINE_SPEC_FORMAT=documentation"
```

[Sign Up](http://about.travis-ci.org/docs/user/languages/ruby/)

[Database Setup](http://about.travis-ci.org/docs/user/database-setup/)

Using ENV variables and before_script steps

[secure env variables](http://about.travis-ci.org/docs/user/build-configuration/#Secure-environment-variables)

## 

On Travis, flick the switch to `on` for a project repo, then push again to Gith 
Flick the switches below to turn on the Travis service hook for your projects, then push to GitHub.

# Deploying

```
$ gem install travis
```
http://docs.travis-ci.com/user/deployment/heroku/


# Resources
- [github](https://github.com/jnicklas/capybara)
- [docs](http://rubydoc.info/github/jnicklas/capybara/master/index)
- [cheatsheet](http://learn.thoughtbot.com/test-driven-rails-resources/capybara.pdf)