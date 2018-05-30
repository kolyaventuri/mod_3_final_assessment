require 'rails_helper'

describe Game, type: :model do
  it { is_expected.to belong_to(:player_1) }
  it { is_expected.to belong_to(:player_2) }

  it { is_expected.to have_many(:plays) }
end
