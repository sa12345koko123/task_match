class Job < ApplicationRecord

  belongs_to :company
  has_many :orders
  has_many :comments, dependent: :destroy

end
