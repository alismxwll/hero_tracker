require 'active_record'
require 'rspec'

require './lib/hero'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))["test"])

RSpec.configure do |config|
  config.before(:each) do
    Hero.all.each {|hero| hero.destroy}
    League.all {|league| league.destroy}
  end
end
