require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'

get '/' do
  html = %q(
  <html><head><title>Movie Search</title></head><body>
  <h1>Find a Movie!</h1>
  <form accept-charset="UTF-8" action="/result" method="post">
    <label for="movie">Search for:</label>
    <input id="movie" name="movie" type="text" />
    <input name="commit" type="submit" value="Search" /> 
  </form></body></html>
  )
end

post '/result' do
  search_str = params[:movie]

  # Make a request to the omdb api here!

  response = Typhoeus.get("http://www.omdbapi.com/", :params => {:s => search_str})

  result = JSON.parse(response.body)

    
  # puts @result["Search"].each {|movies_hash|
  # puts "#{movies_hash['Title']} - #{movies_hash['year']}."}


  # Modify the html output so that a list of movies is provided.
  html_str = "<html><head><title>Movie Search Results</title></head><body><Table><h1>Movie Results</h1>\n<th align=right>YEAR</th><th align=left>&nbsp;&nbsp;TITLE</th>"
  
  result["Search"].each {|movies_hash|
    html_str += "<tr><td align=right>#{movies_hash['Year']}&nbsp;&nbsp;</td> <td>&nbsp;&nbsp;#{movies_hash['Title']} </td></tr>"
  }

  html_str += "</table></body></html>"

end

get '/poster/:imdb' do |imdb_id|
  # Make another api call here to get the url of the poster.
  html_str = "<html><head><title>Movie Poster</title></head><body><h1>Movie Poster</h1>\n"
  html_str = "<h3>#{imdb_id}</h3>"
  html_str += '<br /><a href="/">New Search</a></body></html>'

end

