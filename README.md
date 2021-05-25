# FindJob

One Paragraph of project description goes here

## Summary

  - [Getting Started](#getting-started)
  - [Running the tests](#running-the-tests)
  - [Endpoints](#endpoints)
  - [Built With](#built-with)
  - [Versioning](#versioning)
  - [Authors](#authors)
  - [Acknowledgments](#acknowledgments)

## Getting Started



### For Using Endpoints

Go to [Endpoints](#endpoints) and use `/jobs` and `/salaries` endpoints to recieve salary information and job listings.

### Gemfile
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
![user_create](https://user-images.githubusercontent.com/72912074/119563835-4d3b2380-bd65-11eb-9851-d81397f5ebff.png)


### PATCH findjob-backend.herokuapp.com/api/v1/users
![user_patch](https://user-images.githubusercontent.com/72912074/119563881-57f5b880-bd65-11eb-8f19-f3e63d280dcc.png)


### POST findjob-backend.herokuapp.com/api/v1/sessions
![sessions_create](https://user-images.githubusercontent.com/72912074/119563890-5b893f80-bd65-11eb-84d3-c46982bab2c6.png)


### GET findjob-backend.herokuapp.com/api/v1/salaries
![get_salaries](https://user-images.githubusercontent.com/72912074/119563901-5e843000-bd65-11eb-923f-a061d48fca28.png)


### GET findjob-backend.herokuapp.com/api/v1/salaries
![get_jobs](https://user-images.githubusercontent.com/72912074/119563916-647a1100-bd65-11eb-9bab-7b4bdd93be25.png)


### POST findjob-backend.herokuapp.com/api/v1/saved_jobs
![saved_create](https://user-images.githubusercontent.com/72912074/119563929-67750180-bd65-11eb-9599-3219f9185022.png)


### DELETE findjob-backend.herokuapp.com/api/v1/saved_jobs
![saved_delete](https://user-images.githubusercontent.com/72912074/119563938-69d75b80-bd65-11eb-8a2b-698d22ff9ba3.png)


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
