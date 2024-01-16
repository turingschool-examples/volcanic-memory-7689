require 'rails_helper'

RSpec.describe ScientistExperiment, type: :model do
  describe 'associations' do
    it { should belong_to(:experiment) }
    it { should belong_to(:scientist) }
  end
end
