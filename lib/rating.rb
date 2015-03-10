class Rating < ActiveRecord::Base
  belongs_to :student
  belongs_to :internship
end
