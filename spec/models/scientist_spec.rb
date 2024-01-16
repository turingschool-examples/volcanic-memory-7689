require 'rails_helper'

RSpec.describe Scientist do
  describe "relationships" do
    it { should belong_to(:lab) }
    it { should have_many(:experiments) }
    # it { should have_many(:labs).through(:experiments) }
  end
end