class MinionAttack < ApplicationRecord
  belongs_to :card, foreign_key: :card_id
end
