require_relative 'game'

game = Game.new

game.name_player
game.create_board
game.define_codebreaker
game.define_codemaker(codebreaker)

game.define_secret_code
board.check_guess game.codebreaker.make_guess
game.make_and_check_guess
