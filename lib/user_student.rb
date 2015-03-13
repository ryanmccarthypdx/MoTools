class Student < User
  has_many :ratings
  has_many :internships, :through => :ratings

  def self.internship_data_export
    output_array = []
    header_row = ["Student Name"]
    sorted_internships = Internship.all.sort_by { |internship| internship.id }
    sorted_internships.each do |internship|
      header_row.push(internship.company_name)
    end
    output_array.push(header_row)
    Student.all.each do |student|
      student_row = [student.name]
      sorted_internships.each do |internship|
        if student.top_ten.include?(internship)
          student_row.push(student.top_ten.index(internship) + 1)
        else
          student_row.push(nil)
        end
      end
      output_array.push(student_row)
    end

    CSV.open("public/output.csv", "wb") do |csv|
      output_array.each() do |student_row|
        csv << student_row
      end
    end

  end

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
