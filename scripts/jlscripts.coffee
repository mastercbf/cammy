module.exports = (robot) ->

  robot.respond /movies/i, (msg) ->
    getFilm = Math.floor(Math.random() * 3344)
    msg.http("https://raw.githubusercontent.com/mastercbf/waldy/master/dicksflicks.json")
    .get() (err, res, body) ->
        msg.send "You should watch " + JSON.parse(body)[getFilm]["Film"] + " (" + JSON.parse(body)[getFilm]["Year"] + "), " + "I would rate it a " + JSON.parse(body)[getFilm]["Rating"] + " out of 4!"


  robot.hear /rate( (.+))?/i, (msg) ->
    film_name = msg.match[2]
    msg.http("https://raw.githubusercontent.com/mastercbf/waldy/master/dicksflicks.json")
    .get() (err, res, body) ->
        eat = movie for movie in JSON.parse(body) when movie['Film'] is film_name
        if typeof eat is 'object'
          msg.send "I rated #{eat['Film']} (#{eat['Year']}) a #{eat['Rating']} out of 4!"
        else
          msg.send "I have no clue"
