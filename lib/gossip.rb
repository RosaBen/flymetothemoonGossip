require 'csv'
# require 'pry'

class Gossip 
    attr_accessor :author, :content

        def initialize(author,content)
        @author = author
        @content = content
    end


    def self.init_csv
            CSV.open("./db/gossip.csv", "w") do |header|
                header << ["author", "content"]
            end
    end

        def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv", headers:true ).each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find_author(author)
        self.all.find do |gossip|
            gossip.author == author
        end
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
    end
end

# binding pry