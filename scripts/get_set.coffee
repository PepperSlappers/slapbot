# Description:
#   set, get and delete things
#
# Commands:
#   hubot set <key> <value> – Store the value at key
#   hubot get <key> - return the value for the key
#   hubot delete <key> - removes this from storage
#
# Examples:
#   hubot set how I feel http://i.imgur.com/g7XI2AJ.gif
#   hubot get how I feel

module.exports = (robot) ->

  # if process.env.HUBOT_AUTH_ADMIN?
  #   robot.logger.warning 'The HUBOT_AUTH_ADMIN environment variable is set not going to load roles.coffee, you should delete it'
  #   return

  robot.respond /(store|set|save) (.+) (.+)$/i, (msg) ->
    key = msg.match[2].trim().toLowerCase()
    value = msg.match[3].trim()

    robot.brain[key] = value
    msg.send "Stored #{key}"

  robot.respond /(fetch|get|load) (.+)$/i, (msg) ->
    key = msg.match[2].trim().toLowerCase()
    result = robot.brain[key]
    if typeof result  is "undefined"
      msg.send "I know nothing about #{key}"
    else
      msg.send "#{result}"

  robot.respond /(delete|remove|unset) (.+)$/i, (msg) ->
    key = msg.match[2].trim().toLowerCase()
    delete robot.brain[key]
    msg.send "#{key} is no more"

