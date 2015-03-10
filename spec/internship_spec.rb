require('spec_helper')

describe Internship do
  it { should have_many :ratings }
  it { should have_many(:students).through(:ratings)  }
end
