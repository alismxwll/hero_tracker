class CreateAddLeagueIdToHeroRemoveHeroIdFromLeague < ActiveRecord::Migration
  def change
    add_column :heros, :league_id, :integer
    remove_column :leagues, :hero_id, :integer
  end
end
