class Pledge < ActiveRecord::Base
  belongs_to :backer
  belongs_to :project
  belongs_to :breakpoint
end
