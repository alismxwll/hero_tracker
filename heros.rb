require 'active_record'
require './lib/hero.rb'
require './lib/colors.rb'
require './lib/leagues.rb'
require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def welcome
  puts "Welcome to our Hero tracker!"
  main_menu
end

def main_menu
  choice = nil
  until choice == 'x'
    system("clear")
    puts "[== Super World Main Menu ==]".green
    puts "'h' hero menu"
    puts "'l' league menu"
    puts "'x' to exit this prompt"
    choice = gets.chomp
    case choice
    when 'h'
      hero_menu
    when 'l'
      league_menu
    when 'x'
      puts 'Fly safe!'
    else
      puts 'follow orders, buddy.'
    end
  end
end

def hero_menu
  choice = nil
  system("clear")
  until choice == 'x'
    puts "[== Hero Configuration Menu ==]"
    puts "'a' to add a new hero"
    puts "'l' to list out all heroes"
    puts "'c' complete a hero's training"
    puts "'x' to exit to Hero Main Menu"
    choice = gets.chomp
    case choice
    when 'a'
      add_hero
    when 'l'
      list_heroes
    when 'c'
      complete_training
    when 'x'
      puts "returning to Main"
    else
      puts 'can you not follow orders?'
    end
  end
end

def league_menu
  choice = nil
  system("clear")
  until choice == 'x'
    puts "[== League Control Menu ==]"
    puts "'a' to add a League"
    puts "'p' to place a hero in a league"
    puts "'l' to list leagues of heroes"
    puts "'x' to exit to Hero Main Menu"
    choice = gets.chomp
    case choice
    when 'a'
      add_league
    when 'p'
      add_hero_to_league
    when 'l'
      list_heroes_in_league
    when 'x'
      puts "returning to Main"
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
  hero = Hero.new(name: hero_name, power: hero_power, trained: false)
  hero.save
  puts "\n\t#{hero_name}, who has the power of #{hero_power} has been added to our system.\n\n\tThank you.\n\n\tYou are making the world safer by reporting all heroes you encounter.\n\tPromise we are not using this information for nefarious purposes.\n\n".red
end

def list_heroes
  system("clear")
  puts "Here are all the heroes in our system."
  puts "(id) Name  (trained) (league)"
  puts "----------------------------"
  heroes = Hero.all.sort
  # league = League.all.where(id: hero.league_id)
  League.find
  heroes.each { |hero| puts "(#{hero.id}) #{hero.name}: #{hero.power}" + " (#{hero.trained})".blue + "#{hero.league_id}"}
  puts "\n\n"
end

def list_league
  system("clear")
  puts "Here are the current Hero Leagues"
  leagues = League.all
  leagues.each { |league| puts "(#{league.id}) #{league.name}"}
  puts "\n\n"
end

def list_heroes_in_league
  list_league
  puts "Choose a league to see the heroes in it:"
  league_choice = gets.chomp.to_i
  current_league = League.find(league_choice)
  puts "\n\n"
  heroes = Hero.find(league_choice)
  binding.pry
end

def add_league
  puts 'What is the name of this powerful organization?'
  league_name = gets.chomp
  league = League.new(name: league_name)
  league.save
  puts "\n\t#{league_name}, has been added to our system\n".red
end

def complete_training
  list_heroes
  puts "What powerful being has been trained and deserves recognition?"
  trained_hero = gets.chomp.to_i
  current_hero = Hero.find(trained_hero)
  current_hero.update(trained: true)
  puts "#{current_hero.name} training status:" + " #{current_hero.trained}".magenta
end

def add_hero_to_league
  list_league
  puts "Choose a league (#) to add a hero to it:"
  league_choice = gets.chomp.to_i
  current_league = League.find(league_choice)
  puts "\n\n"
  list_heroes
  puts "Choose a hero (#) to add to #{current_league.name}"
  hero_choice = gets.chomp.to_i
  current_hero = Hero.find(hero_choice)
  current_hero.update(league_id: league_choice)
  puts "#{current_hero.name} is now in #{current_league.name}"
end

welcome









