class ProjectOwner < User
  has_many :projects

  validates :user_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 8..40 }, confirmation: true
end