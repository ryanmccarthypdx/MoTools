class Internship < ActiveRecord::Base
  has_many :ratings
  has_many :students, :through => :ratings

  def self.rated
    rated_internships = []
    Rating.all().each do |rating|
      rated_internships.push(Internship.find_by(id: rating.internship_id))
    end
    Internship.sort_by_rating(rated_internships)
  end

  def self.unrated
    (Internship.all - Internship.rated).shuffle
  end

  def self.sort_by_rating (rated_internships)
    rated_internships.sort_by {|internship| internship.total_rating}.reverse
  end

  def total_rating
    total_rating = rating.company_rating + rating.project_rating + rating.personality_rating
  end

  def rating
    Rating.find_by(internship_id: self.id, student_id: current_user.id)
  end

  private

end
