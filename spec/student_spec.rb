require 'spec_helper'

describe Student do
  it { should have_many :ratings }
  it { should have_many(:internships).through(:ratings) }
end
