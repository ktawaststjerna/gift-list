# Giftlist

This is a Ruby on Rails app that acts as a Giftlist for my friends and family to use. The special reason for this is that it is a spoiler free Giftlist that the whole family can use to mark off what was bought by who, without the giftee knowing what that was.


## Installation

On local computer use Docker for development.

* Create and populate .env file in project file system
    * Add fields
        * POSTGRES_USER=foo
        * POSTGRES_PASSWORD=foobar
        * POSTGRES_DB=giftlist_development
* Run docker container

```bash
docker-compose run --service-ports giftlist sh # Runs and execs into docker container
rails db:setup # Runs seeding and migrations
puma # Runs server
```
## Running Tests

To run tests, run the following command. Currently there are minimal tests.

```bash
  rails test
```


## Deployment

This project is auto deployed to a Heroku Staging server. If you have access to Heroku, you can promote the Staging server to Production to deploy.


## Environment Variables

To run this project, you will need to add the following environment variables to your .env file

`POSTGRES_USER=foo`
`POSTGRES_PASSWORD=foobar`
`POSTGRES_DB=giftlist_development`


## Authors

- [@ktawaststjerna](https://www.github.com/ktawaststjerna)

