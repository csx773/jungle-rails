# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server
10. Open browser and go to `http://localhost:3000/`

## Features
1. Shows sold out badge when an product quantity is 0
2. Only Admin can do the following (after admin authentication):
    - List and create new categories
    - List and add new products using into a category
    - Change the quanitiy of a product
3. User sign up, login, and authentication on certain pages
4. Visitors can browse any page
5. Shows order summary after checking out
6. Email of order summary will be sent after checkout
7. (User only) Can write reviews, rate a product, and delete own review


## Screenshots

!["Home page"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/screenshot-1.png)

!["Cart order"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/screenshot-3.png)

!["credit card"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/screenshot-4.png)

!["Order confirmation"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/Screenshot%20from%202019-05-19%2023-08-18.png)

!["Category page"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/Screenshot%20from%202019-05-19%2023-08-50.png)

!["Admin Products"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/Screenshot%20from%202019-05-19%2023-09-10.png)

!["Admin Category"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/Screenshot%20from%202019-05-19%2023-09-41.png)

!["Product review"](https://github.com/csx773/jungle-rails/blob/master/app/assets/images/screenshots/Screenshot%20from%202019-05-19%2023-11-45.png)


## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>


## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
