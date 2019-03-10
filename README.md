# README

The Zipcode Management web application provides a simple UI that allows you to query zip code details from publicly available HUD data.
The HUD data itself is accessible through the Zipcode Management REST API which exposes APIs to import the HUD data files as well as an API to get the zip code details.

Versions:
The web application is built using Ruby version 2.3, Rails version 5.1.6.1.

Dependencies:
The web application does not use any database.
It mainly depends on Zipcode Management REST API (source code: https://github.com/vkallianpur/zipcodes-api.git) to be up and running
At this time, the APIs/urls are hardcoded in the controllers. 
At this time, there is no built-in authentication. 
