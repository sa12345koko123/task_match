class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  # has_one_attached :profile_image

  # validates :name_family, presence: true, length: { maximum:30 }
  # validates :name_first, presence: true, length: { maximum:30 }
  # validates :name_family_kana, presence: true, length: { maximum:30 }
  # validates :name_first_kana, presence: true, length: { maximum:30 }
  # validates :phone_number, presence: true, numericality: { only_integer:true } ,length: { maximum:21 }, on: :update
  validates :address, presence: true ,length: { maximum:161 }, on: :update
  validates :postal_code, presence: true , length: { is:7} , numericality: { only_interger:true }, on: :update





  # def get_profile_image(width, height)
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpeg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   profile_image.variant(resize_to_limit: [width, height]).processed
  # end


  def full_name
    self.name_family + " " + self.name_first
  end

  def kana_full_name
    self.name_family_kana + " " + self.name_first_kana
  end






  def self.guest
    User.find_or_create_by!(name_family:'guestuser', name_first:'太郎', name_family_kana:'シサク', name_first_kana:'タロウ', email:'xxx@webcamp.jp', handle_name:'タロー', phone_number:'00000000000', address:'テスト県テスト市0000', postal_code:'0000000') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name_family = "guestuser"
    end
  end




end
