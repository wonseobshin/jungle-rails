# Jungle

A mini e-commerce application.

Features:

    - Register a user
    - Log in and out
    - Add and remove products from cart
    - Items can be sold-out
    - Admins can add products
    - Category view (Apparel, electronics, etc.)
    - Checkout with Stripe

![main page](https://github.com/wonseobshin/jungle-rails/blob/master/public/jungle-main.JPG)

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

## Stripe Testing
![stripe view](https://github.com/wonseobshin/jungle-rails/blob/master/public/jungle-stripe.JPG)

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
