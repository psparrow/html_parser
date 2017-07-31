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

## Creating a scrape

Using postman or your favorite tool for testing API endpoints,
create a POST request and pass the following JSON:

	{
	  "url": "http://foo-bar.com"
	}
