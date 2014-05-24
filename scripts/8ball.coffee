# Description:
#   predict outcome
#
# Commands:
#   hubot is some question
#   hubot predict some question
#
# Examples:
#   hubot is brian hungry

thisKey = 'eightBallResponses'

CANNED_RESPONSES = [
  "It is certain",
  "It is decidedly so",
  "Without a doubt",
  "Yes definitely",
  "You may rely on it",
  "As I see it, yes",
  "Most likely",
  "Outlook good",
  "Yes",
  "Signs point to yes",
  "Reply hazy try again",
  "Ask again later",
  "Better not tell you now",
  "Cannot predict now",
  "Concentrate and ask again",
  "Don't count on it",
  "My reply is no",
  "My sources say no",
  "Outlook not so good",
  "Very doubtful"
]

module.exports = (robot) ->

  robot.respond /^(\s*)(is) (.+)\?$/, (msg) ->
    populateKeysIfEmpty
    possibleResponses = robot.brain[thisKey]
    randomIndex = Math.floor Math.random() * (possibleResponses.length + 1)
    msg.send ">#{possibleResponses[randomIndex]}"

  populateKeysIfEmpty = ->
    msg.send "Populating keys"
    possibleResponses = robot.brain[thisKey]
    if typeof possibleResponses is "undefined" or possibleResponses.length is 0
      robot.brain[thisKey] = CANNED_RESPONSES