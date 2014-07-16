class Backer < User
  belongs_to :project
  has_many :pledges

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, confirmation: true
end