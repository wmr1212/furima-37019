class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase_histories

  validates :nickname, presence: true
  validates :first_name, presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
    message: "は、全角で入力して下さい"
    }
  validates :family_name, presence: true, format: {
    with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/,
    message: "は、全角で入力して下さい"
    } 
  validates :first_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: 'は全角カナで入力して下さい'
    }
  validates :family_name_kana, presence: true, format: {
    with: /\A[ァ-ヶー－]+\z/,
    message: 'は全角カナで入力して下さい'
    }
  validates :birth_date, presence: true
end