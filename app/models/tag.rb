class Tag < ApplicationRecord
  has_many :job_tags, dependent: :destroy
  has_many :jobs,through: :job_tags

end
