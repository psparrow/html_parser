# README

## Installation

	$ bunde install
	$ rails db:create
	$ rails db:migrate

## Run the specs

	$ rspec

## Run the server and background jobs locally:

	$ rails s
	$ bundle exec sidekiq -q default

## Using the API Endpoints

### Creating a scrape

Using postman or your favorite tool for testing API endpoints,
create a POST request to the URL below and include the following JSON:

	POST http://localhost:3000/api/v1/scrapes

	{
	  "url": "http://foo-bar.com"
	}

### Retrieving scrapes

Make a GET request to the URL below:

	GET http://localhost:3000/api/v1/scrapes

You can also include an optional page parameter as the endpoint returns
a maximum of 10 URLs per request.

	GET http://localhost:3000/api/v1/scrapes?page=2


### Todo

* Work through Rubocop styling recommendations
