class Student < ActiveRecord::Base
  has_many :ratings
  has_many :internships, :through => :ratings
end
