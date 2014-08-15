require 'spec_helper'

describe League do
  it 'has many heroes' do
    league1 = League.create(name: "League of Rosy Pedals")
    hero1 = Hero.create(name: "Ralph", power: "Wreck it", league_id: league1.id)
    hero2 = Hero.create(name: "Venelopy", power: "Drive Really Fast", league_id:league1.id)
    expect(league1.heros).to eq [hero1, hero2]
  end
end
