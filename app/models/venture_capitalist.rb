class VentureCapitalist
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def total_worth
        my_ventures = FundingRound.all.select {|fund| fund.venture_capitalist == self}
        my_investments = my_ventures.map {|venture| venture.investment}
        my_investments.sum
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |investors|
            investors.total_worth > 1000000000
        end
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        my_rounds = FundingRound.all.select {|round| round.venture_capitalist == self}
        my_startups = my_rounds.map {|round| round.startup}
        my_startups.uniq
    end

    def biggest_investment
        my_rounds = FundingRound.all.select {|round| round.venture_capitalist == self}
        my_investments = my_rounds.map {|round| round.investment}
        largest_investment = my_investments.max
        my_rounds.select {|round| round.investment == largest_investment}
    end

    def invested(domain)
        my_investments = funding_rounds.select {|round| round.startup.domain == domain}
        investments = my_investments.map {|round| round.investment}
        investments.sum
    end
end