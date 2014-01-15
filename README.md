apis_and_json_with_sinatra
==========================

A lab to practice calling apis and parsing the json that is returned.  

# Sinatra OMDB Lab (1/15/2014)
The goal of the lab is to get comfortable with sinatra, api calls and json.  By the end of the lab, you should have an app that uses routes, forms, and an api call that returns json.

# Instructions

Create a movie searching application using the OMDB json api: [http://www.omdbapi.com/](http://www.omdbapi.com/).  For the lab, you will be calling the omdb api using the 's' parameter and the 'i' parameter.

1. Phase 1 - Create a simple search, that presents a form to the user to search for movies.  The form should be routed to a page at '/' and the results should be routed to a post at '/result'.  The results page should list all of the movies found by the search and the year the movie was made.

2. Phase 2 - On the results page, turn each movie and year string into a link.  The link should go to another page called '/poster/[imdb_id]'  On this page the poster of the imdb id given in the url should be displayed

3. Phase 3 (Extra) - On the results page, display the movies in sorted order by year.

