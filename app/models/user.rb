class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :password_confirmation, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :kana_first_name, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  validates :birthday, presence: true

  has_many :items
  has_many :buyers
end
