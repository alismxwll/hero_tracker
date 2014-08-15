class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.column :name, :string
      t.column :hero_id, :int

      t.timestamps
    end
  end
end
