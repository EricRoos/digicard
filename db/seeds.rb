# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
class MinionBuilder
  def initialize
    @attacks = []
  end
  
  def with_name(name)
    @obj_name = name
    self
  end

  def with_image(image_name)
    file = Rails.root.join("db", "seed_images", image_name)
    @image = {io: File.open(file), content_type: 'image/png', filename: File.basename(file)}
    self
  end

  def with_bg_image(image_name)
    file = Rails.root.join("db", "seed_images", image_name)
    @bg_image = {io: File.open(file), content_type: 'image/png', filename: File.basename(file)}
    self
  end

  def with_attack(name, description, damage)
    @attacks << { name:, description:, damage: }
    self
  end

  def build!
    Card::Minion.transaction do
      card = Card::Minion.create!(
        name: @obj_name
      )
      card.image.attach(@image)
      card.background_image.attach(@bg_image)
      @attacks.each do |attack|
        card.minion_attacks.create!(attack)
      end
      card
    end
  end
end

MinionBuilder.new
  .with_name("Experiment #1")
  .with_image("experiment-1.png")
  .with_bg_image("experiment-2-bg.png")
  .with_attack("Slash", "", 20)
  .build!

MinionBuilder.new
  .with_name("Experiment #2")
  .with_image("experiment-2.png")
  .with_bg_image("experiment-2-bg.png")
  .with_attack("Cheap Shot", "", 10)
  .with_attack("Take Cover", "For the next 3 rounds, you have 50% chance to not take damage", 0)
  .build!

