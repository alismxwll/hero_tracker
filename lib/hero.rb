class Hero < ActiveRecord::Base

  def self.not_trained
    where(trained: false)
  end
end
