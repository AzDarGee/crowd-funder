class Project < ActiveRecord::Base
  has_many :backers
  belongs_to :project_owner
  has_many :breakpoints
  has_many :pledges, through: :breakpoints


  # Polymorphic comments
  has_many :comments, :as => :commentable

  # Many breakpoints per project
  accepts_nested_attributes_for :breakpoints, :reject_if => :all_blank, :allow_destroy => true

  # # CarrierWave
  # mount_uploader :image, ImageUploader

  # PaperClip
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "image/svg"]

  # Tags
  acts_as_taggable

end
