require_relative 'game'

game = Game.new

game.name_player
board = game.create_board
game.define_codebreaker
game.define_codemaker(codebreaker)

board.secret_code = codemaker.create_secret_code
board.check_guess codebreaker.make_guess
