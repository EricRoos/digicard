class Card
  class Minion < Card
    has_many :minion_attacks, foreign_key: :card_id
    accepts_nested_attributes_for :minion_attacks
  end
end
