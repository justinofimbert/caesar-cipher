class Player
  attr_reader :role, :is_user
  def initialize(role, is_user)
    @role = role
    @is_user = is_user
  end

  def is_user?
    @is_user
  end
end