class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
    with_options presence: true do
      validates :username
      validates :lastname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を入力してください'}
      validates :firstname, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'を入力してください'}
      validates :lastname_furigana, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'を入力してください'}
      validates :firstname_furigana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'を入力してください'}
      validates :birthday
      validates :password, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'を入力してください'}
      validates :password_confirmation, format: { with: /\A[a-zA-Z0-9]+\z/, message: 'を入力してください'}
      validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'を入力してください'}
      validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'を入力してください'}
      
    end

  #has_many :items
  #has_many :buys

end
