class GameSerializer
  include FastJsonapi::ObjectSerializer
  attributes :scores
end
