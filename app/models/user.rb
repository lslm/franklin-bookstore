# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  has_many :categories
  has_many :orders
  has_many :banners
  has_many :checkouts
  has_many :pages
  has_many :returns
  has_many :addresses
  has_many :credit_cards
  has_many :coupoms

  validates :first_name, presence: false, length: { in: 2..100 }, allow_blank: true
  validates :last_name, presence: false, length: { in: 2..100 }, allow_blank: true
  validates :email, presence: true, length: { in: 5..100 }, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  }
  validates :phone, presence: false, length: { in: 10..16 }, format: { with: /\A[\d\s-]+\z/ }, allow_blank: true

  accepts_nested_attributes_for :addresses

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.extra.raw_info.first_name
      user.last_name = auth.extra.raw_info.last_name
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
end
