# README
---
## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Features](#features)
* [Modeling](#modeling)
* [Status](#status)
* [Inspiration](#inspiration)
* [Testing the deployed application](#testing-the-deployed-application)
***
## General info
### Webbit
A _nearly_ full-feature Reddit clone built with Ruby on Rails.
***
## Technologies
The project is created with/makes use of:
* Bundler version 2.3.5
* Git
* Ruby on Rails version 6.1.6
* Ruby version 3.0.3
* JavaScript - AJAX
* Tailwind CSS version 1.9.6
* Stripe Payments API
* Heroku - Deployment
* PostgreSQL 12 (Production Environment) & Sqlite3 (Development Environment)
---
## Setup
To run this project - locally - on your machine:
```
$ cd your-folder/webbit
$ bundle install
$ yarn install
$ rails db:create
$ rails db:migrate
$ rails db:seed
$ rails server
```
If you want to be able to use the Stripe Payment feature locally:
* Create an account on the Stripe website to be able to get API keys.
* Add your credentials - API keys - to your Rails applicaiton.
* Make sure your private Stripe API key is not available for everybody to see.
***
## Features
* Create/Read/Update/Delete a user account - Login and Logout.
* As a user, I can Create/Read/Update/Delete:
    * A Webbit Community - if created by the user.
    * A Submission in a Webbit Community - if created by the user.
    * A Comment on a Submission in a Webbit Community - if created by the user.
* As a user I can subscribe to a Webbit Community.
* Premium Subscription - removes ads.
    * As a user I can subscribe and unsubscribe of Webbit Premium.
* As a user with admin permission, I can:
    * Delete any user account.
    * Edit and Update - or delete - any Submission on any Webbit Community.
    * Edit and Update - or delete - any Comment on any Submission on any Webbit Community.
    * Edit and Update any community
---
## Modeling
* User - It is focused on the user (email, username...);
* Submission - It is authored by a user. Has different field (image/video, text, link);
* Community - It is the category the Submission belongs to;
* Comment - It is a response given to the Submission from another user or the current user;
* Subscription - A user can subscribe and unsubscribe to a community.
* Premium Subscription - A user can subscribe to Webbit Premium in order to not see ads on the website.
***
## Status
* This project is complete, but I am still looking for new ways/features to improve it.
***
## Testing the deployed application
* Go tho the website: salty-ridge-47981.herokuapp.com
* Login with the example info:
    > Email: carlos@example.com
    > Password: password
* To "subscribe" to Webbit Premium you can use the following test information:
    > Card number: 4242 4242 4242 4242
     MM/YY: 04/24
     CVC: 424
     ZIP: 42424
* Once you are subscribed to Webbit Premium you should be able to get rid of the ads.
