class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_one_attached :company_image

  validates :company_name, presence: true, length: { maximum:30 }, on: :update
  validates :address, presence: true ,length: { maximum:161 }, on: :update
  validates :phone_number, presence: true, numericality: { only_integer:true } ,length: { maximum:21 }, on: :update



  def get_company_image(width, height)
    unless company_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      company_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    company_image.variant(resize_to_limit: [width, height]).processed
  end

# ゲストログイン
  def self.guest
    Company.find_or_create_by!(email:'zzz@webcamp.', company_name:'guestcompany', address:'問題県問題市0000', phone_number:'0000000000') do |company|
      company.password = SecureRandom.urlsafe_base64
      company.company_name = "guestcompany"
    end
  end

end
