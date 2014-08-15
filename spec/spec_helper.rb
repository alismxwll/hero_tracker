require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require './lib/hero'
require './lib/leagues'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.before(:each) do
    Hero.all.each {|hero| hero.destroy}
    League.all {|league| league.destroy}
  end
end
