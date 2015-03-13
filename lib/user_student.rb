class Student < User
  has_many :ratings
  has_many :internships, :through => :ratings

  def sorted_ratings
    ratings.sort_by {|rating| rating.total_rating}.reverse
  end

  def sorted_internships
    sorted_internships = []
    sorted_ratings.each do |rating|
      sorted_internships.push(rating.internship)
    end
    sorted_internships
  end

  def top_ten
    sorted_internships = self.sorted_internships
    if sorted_internships.length >= 10
      top_ten = []
      10.times do
        top_ten.push(sorted_internships.shift)
      end
      top_ten
    else
      sorted_internships
    end
  end
end
