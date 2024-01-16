require 'rails_helper'

RSpec.describe Experiment, type: :model do
  it {should have_many :experiments_scientists}
  it {should have_many(:scientists).through(:experiments_scientists)}
end
