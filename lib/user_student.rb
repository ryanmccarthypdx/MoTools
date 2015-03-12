class Student < User
  has_many :ratings
  has_many :internships, :through => :ratings
end
