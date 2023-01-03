class ColoradoLottery
  attr_reader :registered_contestants,
              :winners,
              :current_contestants

  def initialize
    @registered_contestants = {}
    @winners = []
    @current_contestants = {}
  end

  def interested_and_18?(contestant, game)
    contestant.age >= 18 && contestant.game_interests.include?(game.name)
  end

  def can_register?(contestant, game)
  interested_and_18?(contestant, game) && 
    (!contestant.out_of_state? || game.national_drawing?)
  end

  def register_contestant(contestant, game)
    return unless can_register?(contestant, game)

    @registered_contestants[game.name] = [] if @registered_contestants[game.name].nil?
    
    @registered_contestants[game.name] << contestant

  end

  def eligible_contestants(game)
    @registered_contestants[game.name].find_all do |contestant|
      contestant.spending_money >= game.cost
    end
  end


#   def charge_contestants(game)
#     eligible_contestants(game).each do |contestant|
#       contestant.spending_money -= game.cost
#     end

#     @current_contestants[game] = [] if @current_contestants[gae]

#     @current_contestants[game] << contestant.full_name

#   end
end
