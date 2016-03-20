module.exports = (robot) ->
  robot.respond /movies/i, (msg) ->
    getFilm = Math.floor(Math.random() * 3344)
    msg.http("https://raw.githubusercontent.com/mastercbf/waldy/master/dicksflicks.json")
    .get() (err, res, body) ->
        msg.send "You should watch " + JSON.parse(body)[getFilm]["Film"] + " (" + JSON.parse(body)[getFilm]["Year"] + "), " + "I would rate it a " + JSON.parse(body)[getFilm]["Rating"] + " out of 4!"
