class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :jobs, dependent: :destroy
  has_many :blogs, dependent: :destroy

  def self.guest
    Company.find_or_create_by!(email:'zzz@gmail.com', company_name:'guestcompany', address:'問題県問題市0000', phone_number:'0000000000') do |company|
      company.password = SecureRandom.urlsafe_base64
      company.company_name = "guestcompany"
    end
  end

end
