require 'rails_helper'

RSpec.describe Lab do
  describe "relationships" do
    it { should have_many(:scientists) }
  end
end