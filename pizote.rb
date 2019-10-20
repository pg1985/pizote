require 'discordrb'

clientId = 'haha'
clientSecret = 'haha'
token = 'NjM0NjAyNzIzNTU5NDczMTgy.Xaoskg.GayXSA9bOJv9iXKiLBaVE7qU34c'

doge = "░░░░░░░░░▄░░░░░░░░░░░░░░▄░░░░\n░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌░░░\n░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐░░░\n░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐░░░\n░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐░░░\n░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌░░░ \n░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌░░\n░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐░░\n░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌░\n░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌░\n▀▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐░\n▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌\n▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐░\n░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌░\n░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐░░\n░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌░░\n░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀░░░\n░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀░░░░░\n░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▀▀░░░░░░"

# bot = Discordrb::Bot.new token: token, client_id: clientId
bot = Discordrb::Commands::CommandBot.new token: token, prefix: '!'

bot.command :rfs do |event|
	numbers = 2.times.map{Random.rand(12) + 1}
	first = numbers.first.to_s
	last = numbers.last.to_s
	"Player: `#{numbers.first.to_s}` || DM: `#{numbers.last.to_s}`"
end

bot.command :d20 do |event|
	rolls = 1.times.map{ Random.rand(20) + 1}
  	sum = rolls.reduce(:+)
  	"`#{sum}`"
end

bot.command :roll do|event, roll|
	number, sides = roll.split('d')

	next 'Invalid syntax.. try: `roll 2d10`' unless number && sides

	begin
	    number = Integer(number)
	    sides  = Integer(sides)
  	rescue ArgumentError
    	next 'You must pass two *numbers*.. try: `roll 2d10`'
  	end

  	rolls = number.times.map{ Random.rand(sides) + 1}
  	sum = rolls.reduce(:+)

  # Return the result
  "You rolled: `#{rolls}`, total: `#{sum}`"
end

bot.command :help do|event|
	'''commands:
	!rfs   = Roll for shoes roll.  performs a 2d6 roll for you and the DM.  Whoever has the higher number wins.
	!d20   = Rolls 1d20 automatically.  
	!roll <number>d<sides> = rolls the <number> of dice with <sides> of sides once.  Example `!roll 2d10`
	'''
end

bot.command :doge do|event|
	doge
end

bot.run
