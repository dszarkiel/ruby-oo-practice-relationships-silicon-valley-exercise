class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domain
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        my_rounds = FundingRound.all.select {|round| round.startup == self}
        my_rounds.count
    end

    def total_funds
        my_rounds = FundingRound.all.select {|round| round.startup == self}
        my_funds = my_rounds.map {|round| round.investment}
        my_funds.sum
    end

    def investors
        my_rounds = FundingRound.all.select {|round| round.startup == self}
        my_investors = my_rounds.map {|round| round.venture_capitalist}
        my_investors.uniq
    end

    def big_investors
        investors.select do |investor| VentureCapitalist.tres_commas_club.include?(investor)
        end
    end

end
