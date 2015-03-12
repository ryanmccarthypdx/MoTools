require('spec_helper')

describe Internship do
  it { should have_many :ratings }
  it { should have_many(:students).through(:ratings)  }

  describe('.import_csv') do
    it("should import a single line csv and create a new internship for it, removing the title line") do
      Internship.import_csv("spec/sample_data_for_parser/two_row.csv")
      expect(Internship.all().first.company_name).to(eql("Thetus Corporation"))
    end
  end

end
