class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    with_options presence: true do
      validates :username
      validates :birthday
      validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'を入力してください'}
    end

    with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナでフリガナを入力してください'} do
      validates :lastname_furigana
      validates :firstname_furigana
    end

    with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角で入力してください'} do
      validates :lastname
      validates :firstname
    end

  has_many :items
  has_many :buys

end
