class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :orders
   has_many :comments, dependent: :destroy

  def full_name
    self.name_family + " " + self.name_first
  end

  def kana_full_name
    self.name_family_kana + " " + self.name_first_kana
  end

  def self.guest
    User.find_or_create_by!(name_family:'guestuser', name_first:'太郎', name_family_kana:'シサク', name_first_kana:'タロウ', email:'xxx@gmail.com', handle_name:'タロー', phone_number:'00000000000', address:'テスト県テスト市0000', postal_code:'0000000') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name_family = "guestuser"
    end
  end




end
