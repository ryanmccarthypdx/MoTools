require 'spec_helper'

describe Rating do
  it { should belong_to :student }
  it { should belong_to :internship }
end
