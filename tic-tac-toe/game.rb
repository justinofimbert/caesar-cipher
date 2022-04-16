class Game
  @@scores = {}

  def increase_score(player)
    @@scores[player.name] += 1
  end

  def self.scores
    @@scores
  end
end
