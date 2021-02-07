<p align="center">
  <img width="50%" src="/app/assets/images/meta-og.jpg">
</p>

<h1 align="center">
  Travelmates Documentation
</h1>

Travelmates is an app to enable solo travelers; from finding mates and events to join to getting inspiration for solo trips, Travelmates is the best mate to have when planning a solo trip. 

Travelmates is located at:

* www.travel-mates.co/


## Table of Contents

1. [Environment Setup](#environment-setup)
2. [TravelMates Consumer Website](#travelmates-features)
3. [External Services](#external-services)


## Environment Setup

This application is using: 
* Ruby 2.6.5
* rbenv 1.1.2
* Rails 6.0.3.4

To use this application via Mac, please follow the below steps in your terminal.

To download Homebrew, the package manager we are using, run the following in your terminal:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
```

Install rbenv to manage your ruby version:
```
brew install rbenv
rbenv install 2.6.6
```

Set the correct ruby version:
```
rbenv global 2.6.6
```
OR, if you are in your project directory and only want to change the ruby version locally:
```
rbenv local 2.6.6
```

Install postgres, the database the application is leveraging: 
```
brew install postgresql
brew services start postgresql
```

In your terminal, run the following the clone the project onto your local machine: 
```
git clone git@github.com:sheesh19/travelmate-up.git
```

* For the final setup for the packages, gems, and seed file, run the following: 
```
bundle install
yarn install

rails db:create
rails db:migrate
rails db:seed
```

## Travelmates Features

[Access the website here](www.travel-mates.co/)


<p align="center">
  <img width="40%" src="/app/assets/images/website-cover.png">
  <img width="40%" src="/app/assets/images/website-insp.png">
</p>


#### Users for the consumer website are: 
* solo travellers looking for mates to meet up with, ideas of activities from other solo travellers, ideas for solo events or trips

#### The consumer facing website is where users are able to: 
* find curated experiences from other solo travellers
* track, post, or share their own solo trips
* add events for people to join
* manage mate up requests: approve, cancel, decline
* sign up for other solo travellers' events
* search through activities, locations, or events for inspiration

#### Other features include: 

* emails are sent via ActionMailer and Postmark
* autocomplete for locations via Google Places
* maps are from Mapbox


## External Services
* [Google Developer Console](https://console.developers.google.com/) for Google Places autocomplete
* [Mapbox](https://www.mapbox.com/) for visual maps
