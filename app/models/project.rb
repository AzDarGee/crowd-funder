class Project < ActiveRecord::Base
  has_many :backers
  belongs_to :project_owner

end
