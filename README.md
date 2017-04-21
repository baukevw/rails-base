# Rails Base

This Rails Base installation contains an extended gemfile. Included are the following gems:

* Postgres
* Dotenv
* Rails ERD
* Rubocop with extentions
* Carrierwave
* Mini Magic
* RMagic
* Rspec
* Factory Girl
* FFaker
* Database Cleaner
* Capybara with extentions
* Shoulda Matchers
* Simplecov

### Usage

Clone the project to your local machine:

```git clone git@github.com:baukevw/rails-base.git```

Go to the directory:
```cd rails-base```

Remove the git repository:
```rm -rf .git```

Now install the gems, run:
```bundle install```

Before you start your project, you'll need to rename the project first:

```rails g rename:app_to New-Name```

Now you can create your Database by doing:

``` Rake db:create ```

That's it!
