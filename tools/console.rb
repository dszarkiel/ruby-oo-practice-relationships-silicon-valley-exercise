require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run befo4e hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Company1", "Dom", "domain3")
startup2 = Startup.new("Company2", "Dena", "domain3")
startup3 = Startup.new("Company3", "Dena", "domain3")


venture_capitalist1 = VentureCapitalist.new("Max")
venture_capitalist2 = VentureCapitalist.new("Derick")

funding_round1 = FundingRound.new(startup1, venture_capitalist1, "Angel", 30)
funding_round2 = FundingRound.new(startup2, venture_capitalist2, "Seed", 500)
funding_round3 = FundingRound.new(startup2, venture_capitalist2, "Seed", 10000000000)
funding_round4 = FundingRound.new(startup2, venture_capitalist1, "Seed", 70)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line