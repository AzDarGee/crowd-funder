class ProjectOwner < User
  has_many :projects

  validates :name, presence: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :create
  validates :password, length: { minimum: 8 }, confirmation: true, on: :create
end