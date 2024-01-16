require 'rails_helper'

RSpec.describe Scientist do
  it {should belong_to :lab}
  it {should have_many :experiments_scientists}
  it {should have_many(:experiments).through(:experiments_scientists) }
end