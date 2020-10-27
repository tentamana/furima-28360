class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :orders        

  validates :nickname, presence: true
  validates :name, presence: true, format: { with: /\A[\p{katakana}, {Hiragana}, {一-龠々}\p{blank}ー－]+\z/}
  validates :last_name, presence: true, format: { with: /\A[\p{katakana}, {Hiragana}, {一-龠々}\p{blank}ー－]+\z/}
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  validates :birthday, presence: true         
        
        
        


end
