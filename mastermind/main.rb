require_relative 'game'

game = Game.new

game.name_player
board = game.create_board
codebreaker = game.define_codebreaker
codemaker = game.define_codemaker(codebreaker)

board.secret_code = codemaker.create_secret_code