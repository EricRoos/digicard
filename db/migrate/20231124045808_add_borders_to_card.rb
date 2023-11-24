class AddBordersToCard < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :outer_border_color, :string
    add_column :cards, :inner_border_color, :string
  end
end
