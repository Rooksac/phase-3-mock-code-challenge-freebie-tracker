class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        self.freebies.exists?(item_name: item_name)
    end

    def give_away(dev, freebie)
        if self.freebies.exists?(id: freebie.id)
            freebie.update(dev_id: dev.id)
        else
            nil
        end
    end
end
