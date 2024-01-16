require 'rails_helper'

RSpec.describe Lab do
  describe "relationships" do
    it { should have_many(:scientists) }
    # it { should have_many(:experiments) }
    # it { should have_many(:scientists).through(:experiments) }
  end
end