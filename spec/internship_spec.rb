require('spec_helper')

describe Internship do
  it { should have_many :ratings }
  it { should have_many(:students).through(:ratings)  }

  describe('.import_csv') do
    it("should import a single line csv in the appropriate way") do
      Internship.import_csv("spec/sample_data_for_parser/row1_only.csv")
      expect(Internship.all().first.company_name).to(eql("Your company name"))
    end
  end

end
