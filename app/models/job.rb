class Job < ApplicationRecord

  belongs_to :company
  has_many :orders
  has_many :comments, dependent: :destroy
  has_many :job_tags, dependent: :destroy
  has_many :tags,through: :job_tags



  def save_tag(sent_tags)
    # タグが存在する場合、タグの配列として全て習得
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    # 現在取得したjobに存在するタグから、送信されてきたタグを除いたタグをold_tags
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから、現在存在するタグを除いたタグをnew_tags
    new_tags = sent_tags - current_tags


    # 古いタグを削除
    old_tags.each do |old|
      self.job_tags.delete Tag.find_by(tag_name: old)
    end
    new_tags.each do |new|
      new_job_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_job_tag
    end
  end

end
