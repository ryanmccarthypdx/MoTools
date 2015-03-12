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
    rows = []
    CSV.foreach(csv_route) do |row|
      rows.push(row)
    end
    if (rows.first[0] == "Timestamp") && (rows.first[1] == "Your company name")
      rows.shift()
    end

    rows.each() do |row|
      ####properly formats boolean value:
      if (row[6] == "Yes")
        intern_value = "true"
      else
        intern_value = "false"
      end

      ####checks if internship already exists:
      existing_internship = Internship.find_by(company_name: row[1]) || false
      if existing_internship
        existing_internship.update({
          contact_name: row[3],
          contact_phone: row[4],
          contact_email: row[5],
          company_website: row[16],
          company_address: row[2],
          company_description: row[8],
          intern_work: row[9],
          intern_ideal: row[10],
          intern_count: row[17],
          intern_clearance: intern_value,
          intern_clearance_description: row[7],
          mentor_name: row[12],
          mentor_email: row[13],
          mentor_phone: row[15]
          })
      else
        Internship.create({
          company_name: row[1],
          contact_name: row[3],
          contact_phone: row[4],
          contact_email: row[5],
          company_website: row[16],
          company_address: row[2],
          company_description: row[8],
          intern_work: row[9],
          intern_ideal: row[10],
          intern_count: row[17],
          intern_clearance: intern_value,
          intern_clearance_description: row[7],
          mentor_name: row[12],
          mentor_email: row[13],
          mentor_phone: row[15]
        })
      end
    end
  end

  private


end
