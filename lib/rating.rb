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
end
