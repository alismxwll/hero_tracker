class CreateAddTrainedColumn < ActiveRecord::Migration
  def change
    add_column :heros, :trained, :boolean
  end
end
