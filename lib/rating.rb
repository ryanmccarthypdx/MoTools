class Rating < ActiveRecord::Base
  belongs_to :student
  belongs_to :internship

  def self.possible_ratings
    return [
      {value: -10, label: "Sounds super lame"},
      {value: -1, label: "Sounds a little lame"},
      {value: 0, label: "Sounds OK"},
      {value: 1, label: "Sounds pretty cool"},
      {value: 3, label: "Sounds HYPERAWESOME!!!1"},
      ]
  end

  # def self.sort_by_rating (rated_internships)
  #   rated_internships.sort_by {|internship| internship.total_rating}.reverse
  # end

  def total_rating
    company_rating + project_rating + personality_rating
  end

end
