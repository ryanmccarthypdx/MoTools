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
    Rating.find_by(internship_id: self.id, student_id: 1)
  end

  def self.import_csv (csv_route)
    output = []
    CSV.foreach(csv_route) do |row|
      output.push(row)
    end
    output
  end

  private

end
