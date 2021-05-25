# FindJob

One Paragraph of project description goes here

## Summary

  - [Getting Started](#getting-started)
  - [Running the tests](#running-the-tests)
  - [Endpoints](#endpoints)
  - [Built With](#built-with)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [License](#license)
  - [Acknowledgments](#acknowledgments)

## Getting Started



### For Using Endpoints

Go to [Endpoints](#endpoints) and use `/jobs` and `/salaries` endpoints to recieve salary information and job listings.

#### Gemfile
![fj-gemfile](https://user-images.githubusercontent.com/72912074/119561756-d0a74580-bd62-11eb-97ae-2fecf29ae291.png)

### Installing

- Fork and clone this repo
- Run `bundle install`
- Run `rails db:{create,migrate,seed}`

## Running the tests

- Run `bundle exec rspec` to check the test suite

### Break down into end to end tests

Explain what these tests test and why

    Give an example

### And coding style tests

Explain what these tests test and why

    Give an example

## Endpoints

### POST findjob-backend.herokuapp.com/api/v1/users
![user_create](https://user-images.githubusercontent.com/72912074/119562547-af932480-bd63-11eb-83c7-f4040da2a46b.png)


### PATCH findjob-backend.herokuapp.com/api/v1/users
![user_update](https://user-images.githubusercontent.com/72912074/119562579-b9b52300-bd63-11eb-9673-bdebd5d038dd.png)


### POST findjob-backend.herokuapp.com/api/v1/sessions
![session_create](https://user-images.githubusercontent.com/72912074/119562594-bf126d80-bd63-11eb-99c7-7bf564d5e166.png)


### GET findjob-backend.herokuapp.com/api/v1/salaries
![salary-get](https://user-images.githubusercontent.com/72912074/119562622-c6397b80-bd63-11eb-860a-9ffbd7eaad2f.png)


### GET findjob-backend.herokuapp.com/api/v1/salaries
![job-get](https://user-images.githubusercontent.com/72912074/119562719-e36e4a00-bd63-11eb-9cd1-40669f0fd73c.png)


### POST findjob-backend.herokuapp.com/api/v1/saved_jobs
![saved_create](https://user-images.githubusercontent.com/72912074/119562636-ccc7f300-bd63-11eb-8f87-95f8a2ea9c61.png)


### DELETE findjob-backend.herokuapp.com/api/v1/saved_jobs
![saved_delete](https://user-images.githubusercontent.com/72912074/119562654-d18ca700-bd63-11eb-9bdf-20f1944e9b6d.png)


## Built With

  - Rails API

## Versioning

This is version 1 of FindJob BackEnd, for any updated versions please check back here. New versions will be linked below:

## Authors

  - **Andrew Johnston** - 
    [Andrew Johnston](https://github.com/omegaeye)
    
  - **Khoa Nguyen**
    [Khoa Nguyen](https://github.com/omegaeye)

## Acknowledgments

  - [Trevor Suter](https://github.com/Trevorsuter) & [Joseph Budina](https://github.com/josephbudina) for creating the MicroService in Flask
  - [Aaron Foucheaux](https://github.com/Afoucheaux) & [Connor Anderson-Larson](https://github.com/ConnorAndersonLarson) for building out the FrontEnd in React
