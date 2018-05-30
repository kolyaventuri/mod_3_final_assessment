class GameSerializer
  include FastJsonapi::ObjectSerializer
  attribute :game_id do |object|
    object.id
  end
  attributes :scores
end
