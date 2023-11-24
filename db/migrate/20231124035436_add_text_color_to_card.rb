class AddTextColorToCard < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :text_color, :string
  end
end
