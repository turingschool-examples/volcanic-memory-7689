require 'rails_helper'

RSpec.describe Experiment, type: :model do
  it {should have_and_belong_to_many :scientists}
end