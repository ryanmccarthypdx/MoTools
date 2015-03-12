class Internship < ActiveRecord::Base
  has_many :ratings
  has_many :users, :through => :ratings
  attr_accessor :student

  def rating
    Rating.find_by(internship_id: self.id)
  end

  private

end
