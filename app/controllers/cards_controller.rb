class CardsController < ApplicationController
  def show
    @card = Card.find(params[:id])
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    @card.update!(card_params)
    redirect_to edit_card_path(@card)
  end

  protected

  def card_params
    params.require(:card_minion).permit(:text_color, :background_image, :outer_border_color, :inner_border_color, :name)
  end
end
