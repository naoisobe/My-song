class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_premium_member, only: %i[new create]
  before_action :authenticate_general_member, only: %i[destroy]
  require 'payjp'
  def new
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAY_JP_API_KEY)
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
        card: params['payjp-token']
      )

      subscription = Payjp::Subscription.create(
        customer: customer,
        plan: 'pln_ab834b1d815833e30ca9dea71131'
      )

      @card = Card.new(user_id: current_user.id, customer_id: customer.id, subscription_id: subscription.id, card_id: customer.default_card)
      @card.save
      flash[:notice] = '有料会員に変更されました'
      redirect_to songs_path
    end
    current_user.update(member_status: 1)
  end

  def destroy
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAY_JP_API_KEY)
    if Card.find_by(user_id: current_user.id)
      card = Card.find_by(user_id: current_user.id)
      subscription = Payjp::Subscription.retrieve(card.subscription_id)
      subscription.delete
      current_user.update(member_status: 0)
      card.destroy
      flash[:notice] = '定期課金を解約しました'
      redirect_to songs_path
    end
  end

  private

  def authenticate_premium_member
    redirect_to songs_path if current_user.member_status == '有料会員'
  end

  def authenticate_general_member
    redirect_to songs_path if current_user.member_status == '一般会員'
  end
end
