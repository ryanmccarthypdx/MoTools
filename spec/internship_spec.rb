require('spec_helper')

describe Internship do
  it { should have_many :ratings }
  it { should have_many(:students).through(:ratings)  }

  describe('.import_csv') do
    it("should import a single line csv and create a new internship for it, removing the title line if present") do
      Internship.import_csv("spec/sample_data_for_parser/two_row.csv")
      expect(Internship.all().first.company_name).to(eql("Thetus Corporation"))
    end
    it("will not remove the title line if there is not one present") do
      Internship.import_csv("spec/sample_data_for_parser/second_row_only.csv")
      expect(Internship.all().first.company_name).to(eql("Thetus Corporation"))
    end
    it("formats true/false values when additional clearance is required") do
      Internship.import_csv("spec/sample_data_for_parser/Sample_CSV.csv")
      all_internships = Internship.all()
      expect(all_internships[7].intern_clearance).to(eql(true))
      expect(all_internships[6].intern_clearance).to(eql(false))
    end
  end

end
