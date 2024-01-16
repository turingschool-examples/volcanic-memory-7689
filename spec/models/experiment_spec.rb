require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe "relationships" do
    it { should belong_to(:lab) }
    it { should belong_to(:scientist) }
  end
end
