# AceBook

A group project, part of the makers course. The aim of the project is to practice agile sprint methods via building an application similar to Facebook. This is also the groups first exposure to the  Rails Framework.
The basic functionality developed so far:
- a full CI/CD pipeline (Travis and Heroku)
- addition of tooling for better code - Rubocop and Simplecov 
- a user can sign up / in
- a view a list of posts in chronological order
- a user can add a post

 *Coming features:*
 - a user can delete / update their own posts

## Technology used
* Ruby on Rails
* Travis CI
* Heroku


## To run the app:
https://acebook-data-thieves.herokuapp.com/  

## Instructions to run locally
Fork this repository, clone it to your local machine and run the following commands:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec
> bin/rails server
```

