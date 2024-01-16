require 'rails_helper'

RSpec.describe Lab do
  it {should have_many :scientists}
  it {should have_many(:experiments_scientists).through(:scientists) }
  it {should have_many(:experiments).through(:experiments_scientists) }
end