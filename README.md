# Capstone Project

## Link to Client Repository

https://github.com/g-walkersmith4492/slurp-client

## What Slurp does and how it works:

Slurp is an application where users can review ramen restaurants, view others reviews of ramen restaurants, and search to find ramen restaurants domestically and around the world.  You can search by location with the preference for best match, highest rated, or by price.  The user can only use these features once they sign up for Slurp and sign in to their account.  The user can edit their reviews and delete their reviews.  The user also has the capability to change their password and sign out of their account.

Slurp's back-end is built using Rails/PostgreSQL which accepts numerous attributes for a resource called Review.  This was done using an open read controller, thus a signed in user can view the reviews of everyone using Slurp, but not edit or delete them.  The user resource was already set up in the rails api template document.  The relationship set up on the background is that a User has many reviews.  The app is deployed on heroku so that it can be accessed by the deployed front-end.

The front-end for Slurp is built in React.js, and sends information to the back-end using axios.  Authentication for a user is already built in to the react template.  This app uses a 3rd party API provided by Yelp called "business search", which needs a yelp_key which is stored on the back-end.


## Link to deployed sites

https://slurp-api.herokuapp.com
https://g-walkersmith4492.github.io/slurp-client/


## List of Technologies used during this project for front-end:

- Ruby on Rails
- PostgreSQL
- API
- HTTParty
- Heroku


## ERD:

 ![ERD](https://i.imgur.com/9AODcvI.jpg)




## Unsolved Problems/Future Plans:

One problem I currently have is refactoring the function which determines what price parameter to pass to the third party api.  Although it works, this is done through four different functions, when I feel as though it could be done through one.  Additionally, I would really like if users could use AWS to upload their own pictures for reviews.

A future plan I have for the app is to change the currently display of the rating (1/5) to something which displays stars instead.  I also have a lot of inconsistent styling (especially with buttons), which make the application look a little bit disjointed.  Additionally, I do not really like the way one resource is displayed on the page as the text is hard to read, so I would like to update that in the future.

## Planning/Development Process:

I approached this project by following the suggested schedule and utilizing processes I found successful during previous projects (working in public places around others, using the issue queue).  I first started with creating my resource, and testing it with curl scripts to make sure that Open Read Controller was working appropriately, as this is my first time using it.  I managed to have CRUD down pretty quickly for my resource, largely because we very recently did this exercise using our full-stack project, which has a similar database to my current project.  Additionally, I managed to set up a third party API call for a different project, thus it did not take me a long time to integrate it in to this project.

For problem solving, as usual, I relied heavily on console.logs to view things in the browser to trouble shoot what was going on.  Additionally, I found a lot of useful information in the httparty docs on how to make third party API requests on the back-end.

One thing which took me more time, but helped me learn react, is not to copy and paste from any prior exercises where we had to CRUD a resource. Although It caused me to run in to some errors, I now have a much stronger understanding of how react works.


## Setup Installation

Below are some step by step instructions to install this front-end repository:

1. Fork and clone this project from github.
2. In the newly created file in your terminal, run git init
3. Empty this README.md and fill with your own content
4. Install dependencies with bundle install
5. Run gem install httparty
6. Add "gem 'httparty'"" to Gemfile
7. Get add and commit your initial changes
8. Run your server with bin/rails server

## Routes

### Authentication
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/sign-up`             | `users#signup`    |
| POST   | `/sign-in`             | `users#signin`    |
| PATCH  | `/change-password/`    | `users#changepw`  |
| DELETE | `/sign-out/`           | `users#signout`   |
### Reviews
| Verb   | URI Pattern            | Controller#Action |
|--------|------------------------|-------------------|
| POST   | `/reviews`               | `reviews#create`    |
| GET    | `/reviews`               | `reviews#index`     |
| GET    | `/reviews/:id`           | `reviews#show`     |
| PATCH  | `/reviews/:id`           | `reviews#update`    |
| DELETE | `/reviews/:id`           | `reviews#destroy`   |
| POST   | `/yelp-search`       | `reviews#yelp_search` |
| POST   | `/yelp-search-specs`   | `reviews#yelp_search_specs` |
| POST | `/yelp-search-price`   | `reviews#yelp_search_price` |
