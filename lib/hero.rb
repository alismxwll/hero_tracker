class Hero < ActiveRecord::Base

# belongs_to(:leagues)

  def self.not_trained
    where(trained: false)
  end
end
