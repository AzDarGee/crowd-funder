class Project < ActiveRecord::Base
  has_many :backers
  belongs_to :project_owner
  has_many :breakpoints
  has_many :taggings
  has_many :tags, through: :taggings

  # Many breakpoints per project
  accepts_nested_attributes_for :breakpoints, :reject_if => :all_blank, :allow_destroy => true

  # CarrierWave
  mount_uploader :image, ImageUploader

  # # PaperClip
  # has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]


  def tag_list
    tags.map(&:title).join(", ")
  end

  def tag_list=(names)
    self.tags = names.split(", ").map do |n|
      Tag.where(title: n.strip).first_or_create! #throws an exception
    end
  end

end
