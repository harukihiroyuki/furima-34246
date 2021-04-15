class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    with_options presence: true do
      validates :username
      validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'lastnameは全角で入力してください'}
      validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'firstnameは全角で入力してください'}
      validates :lastname_furigana, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'カタカナでフリガナを入力してください'}
      validates :firstname_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'カタカナでフリガナを入力してください'}
      validates :birthday
      validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'を入力してください'}
    end

  #has_many :items
  #has_many :buys

end
