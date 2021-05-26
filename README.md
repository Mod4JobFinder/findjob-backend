# FindJob

  A platform where users can find the average salary of tech jobs in urban areas across North America, as well as search for job listings and link to their application page. This platform is the backend of a service oriented architecture built using rails api and consumes two microservices built using flask python. The app consumes the microservices on set intervals to build the backend database and send the data as a response to the user's request.  

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

- `bundle exec rspec` to run the test suite

### Sample of Tests Across the App

#### User Create Happy Path
Tests to to make sure that given valid parameters, a user is created in the backend and serialized as json to be sent to the frontend.
![user_happypath](https://user-images.githubusercontent.com/72912074/119583439-e11be800-bd83-11eb-9a52-4556784dae57.png)

#### User Create Sad Path
Tests that if the password and password confirmation do not match, the frontend should be returned a 400 status for bad parameters.
![password_sadpath](https://user-images.githubusercontent.com/72912074/119583463-ebd67d00-bd83-11eb-9b7e-0ffd97034b42.png)

#### Saved Job Post Happy Path
Tests to to make sure that given valid parameters, a saved job is created in the backend and serialized as json to be sent to the frontend.
![saved_job_happy](https://user-images.githubusercontent.com/72912074/119583535-0c063c00-bd84-11eb-9c30-7408c29e54ee.png)

#### Saved Job Delete Happy Path
Tests to to make sure that given valid parameters, a saved job is deleted from the backend and 'saved job destroyed' is serialized as json to be sent to the frontend.
![saved_job_happy_2](https://user-images.githubusercontent.com/72912074/119583565-1c1e1b80-bd84-11eb-9890-8a195d95cb42.png)

#### User Model Test
Tests that all of a User's relationships and validations are set up correctly.
![user_spec](https://user-images.githubusercontent.com/72912074/119583582-25a78380-bd84-11eb-986f-f0519710f2f7.png)

#### Salary Service Happy Path
Tests that our API call is being made correctly to the MicroService and we are receiving data as we thought we would.
![salary_service](https://user-images.githubusercontent.com/72912074/119583601-2fc98200-bd84-11eb-931b-bb337ac0b96e.png)

#### Job Facade Happy Path
Tests that given valid arguments, the method creates JobListings in the DB along with the correct attributes.
![job_facade](https://user-images.githubusercontent.com/72912074/119583624-38ba5380-bd84-11eb-89d7-1ab4baceaecb.png)

## Endpoints

### POST `findjob-backend.herokuapp.com/api/v1/users`
Creates a user in the DB as long as valid parameters are sent as the body of the request.
![user_create](https://user-images.githubusercontent.com/72912074/119563835-4d3b2380-bd65-11eb-9851-d81397f5ebff.png)

### PATCH `findjob-backend.herokuapp.com/api/v1/users`
Updates the user's attributes (other than email and password) in the DB as long as valid parameters are sent as the body of the request.
![user_patch](https://user-images.githubusercontent.com/72912074/119563881-57f5b880-bd65-11eb-8f19-f3e63d280dcc.png)

### POST `findjob-backend.herokuapp.com/api/v1/sessions`
Authenticates the parameters of email and password match for a user in the DB.
![sessions_create](https://user-images.githubusercontent.com/72912074/119563890-5b893f80-bd65-11eb-84d3-c46982bab2c6.png)

### GET `findjob-backend.herokuapp.com/api/v1/salaries`
Returns a list of salaries for urban areas, given valid parameter of urban area.
![get_salaries](https://user-images.githubusercontent.com/72912074/119563901-5e843000-bd65-11eb-923f-a061d48fca28.png)

### GET `findjob-backend.herokuapp.com/api/v1/jobs`
Returns a list of job listings for a given city, given valid parameter of city and/or title.
![get_jobs](https://user-images.githubusercontent.com/72912074/119563916-647a1100-bd65-11eb-9bab-7b4bdd93be25.png)

### POST `findjob-backend.herokuapp.com/api/v1/saved_jobs`
Creates a saved job in the database, given valid parameters of an exisiting user's ID and the job information.
![saved_create](https://user-images.githubusercontent.com/72912074/119563929-67750180-bd65-11eb-9599-3219f9185022.png)

### DELETE `findjob-backend.herokuapp.com/api/v1/saved_jobs`
Destroys a saved job in the database, given valid parameters of an exisiting saved_job ID.
![saved_delete](https://user-images.githubusercontent.com/72912074/119563938-69d75b80-bd65-11eb-8a2b-698d22ff9ba3.png)

## Built With

  - Rails API
  - BCrypt
  - FastJsonApi
  - RSpec
  - Capybara
  - VCR
  - SimpleCov

## Versioning

This is version 1 of FindJob BackEnd, for any updated versions please check back here. New versions will be linked below:

## Authors

  - **Andrew Johnston** - 
    [Andrew Johnston](https://github.com/omegaeye)
    
  - **Khoa Nguyen** - 
    [Khoa Nguyen](https://github.com/omegaeye)

## Acknowledgments

  - [Trevor Suter](https://github.com/Trevorsuter) & [Joseph Budina](https://github.com/josephbudina) for creating the MicroService in Flask
  - [Aaron Foucheaux](https://github.com/Afoucheaux) & [Connor Anderson-Larson](https://github.com/ConnorAndersonLarson) for building out the FrontEnd in React
