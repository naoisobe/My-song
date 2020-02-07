class CardsController < ApplicationController
  require 'payjp'
  def new
  end

  def create
    Payjp.api_key = 'sk_test_dadbfe665e6cc6dd9cad299f'
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to songs_path
      else
        redirect_to new_card_path
      end
      Payjp::Subscription.create(
        customer: customer,
        plan: 'pln_ab834b1d815833e30ca9dea71131'
      )
    end
    current_user.update(member_status: 1)
  end
end
