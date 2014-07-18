class Backer < User
  belongs_to :project
  has_many :pledges
  has_many :comments

  validates :name, presence: true, on: :create
  validates :email, presence: true, uniqueness: true, on: :create
  validates :password, length: { minimum: 8 }, confirmation: true, on: :create
end