# Description:
#   predict outcome
#
# Commands:
#   hubot is <some question>
#   hubot predict <some question>
#   hubot predict add <repsonse>
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
  # robot.respond /predict\-add (.*)/, (msg) ->
  #   robot.brain[thisKey] = (robot.brain[thisKey] || []) + msg.match[1]
  #   msg.send "Added #{msg.match[1]} to my list of outcomes"

  robot.respond /(is|predict) (.+)/i, (msg) ->
    possibleResponses = CANNED_RESPONSES# + robot.brain[thisKey]
    msg.reply msg.random possibleResponses