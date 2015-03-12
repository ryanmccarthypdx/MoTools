require('spec_helper')

describe Internship do
  it { should have_many :ratings }
  it { should have_many(:students).through(:ratings)  }

  describe('.import_csv') do
    it("should import the csv in the most basic fashion imaginable") do
      expect(Internship.import_csv("../Sample_CSV.csv")).to(eql(""))
    end
  end

end
