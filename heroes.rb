require 'active_record'
require './lib/hero.rb'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to our Hero tracker!"
  main_menu
end

def main_menu
  choice = nil
  system("clear")
  until choice == 'x'
    puts "'a' to add a new hero"
    puts "'l' to list out all heroes"
    puts "'x' to exit this prompt"
    puts "'d' to mark a hero as terminated"
    choice = gets.chomp
    case choice
    when 'a'
      add_hero
    when 'l'
      list_heroes
    when 'd'
      mark_terminated
    when 'x'
      puts 'Fly safe!'
    else
      puts 'follow orders, buddy.'
    end
  end
end

def add_hero
  puts 'What is the name of this powerful being?'
  hero_name = gets.chomp
  puts 'What amazing power do they have?'
  hero_power = gets.chomp
  hero = Hero.new(name: hero_name, power: hero_power)
  hero.save
  puts "#{hero_name}, who has the power of #{hero_power} has been added to our system. Thank you. You are making the world safer by reporting all heroes you encounter, we promise we are not using this information for nefarious purposes.\n\n"
end

def list_heroes
  puts "Here are all the heroes in our system."
  heroes = Hero.all
  heroes.each { |hero| puts "(#{hero.id}) #{hero.name}: #{hero.power}" }
  puts "\n\n"
end



welcome
