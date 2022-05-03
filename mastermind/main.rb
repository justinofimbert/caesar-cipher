require_relative 'game'

game = Game.new

game.name_player
game.create_board
game.define_codebreaker
game.define_codemaker

game.define_secret_code
game.play
