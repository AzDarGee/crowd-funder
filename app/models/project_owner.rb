class ProjectOwner < User
  has_many :projects

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, confirmation: true
end