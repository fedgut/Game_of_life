require_relative '../lib/game.rb'

game = Game.new

game.boot
game.turn if game.seed_manager.validate
