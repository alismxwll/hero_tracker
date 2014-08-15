require 'spec_helper'

describe Hero do
  it 'can return if a hero is trained (true or false)' do
    not_trained_hero = (1..2).to_a.map {|number| Hero.create(name: "hero #{number}", trained: false ) }
    trained_hero = Hero.create({name: "trained hero", trained: true})
    expect(Hero.not_trained).to eq not_trained_hero
  end
end
