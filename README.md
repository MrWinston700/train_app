# train_app README

## Video Walkthrough

https://youtu.be/PY7toc88tCk

## Tools Used

Ruby on Rails, SQLite, OmniAuth

## Features

Login via OmniAuth through github.
Full crud for train routes owned by user.

## Overview

This project was made with the goal of learning the rails ecosystem. It's an app that uses rails authentication to save user data as well as keep them logged in via sessions.

## Installation

Fork and clone repo

    $ git clone https://github.com/superHotStuff/train_app
    
    
Backend terminal instructions: 

    $ cd train_app
    $ bundle install
    $ rails db:migrate
    $ rails db:seed
    $ rails s

## Usage

User will have to sign up or log in to fully interact with website.  
Once logged in, user will be able to see their profile with all the trains they have booked along with the additional routes they have created for that train.
User can delete any route they no longer want.
User can add routes via the home page with routes created by the admin as well as others.

## Challenge

Most challenging aspect of this project was setting up omniAuth for user sign in/ sign up and creating a nested attribute for users to submit.

## Future Implementations

 ui overhaul

## Contributing

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

