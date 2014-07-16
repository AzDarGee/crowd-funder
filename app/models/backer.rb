class Backer < User
  belongs_to :project
  has_many :pledges

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { in: 8..40 }, confirmation: true
end