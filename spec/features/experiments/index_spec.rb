require "rails_helper"

describe "User Story 3: Experiment Index page" do
  before :each do
    @lab_1 = Lab.create!(name: "Spencer Mansion")
    @lab_2 = Lab.create!(name: "Raccoon City Underground")

    @scientist_1 = @lab_1.scientists.create!(name: "Albert Wesker", specialty: "Bio-engineering", university: "Oxford")
    @scientist_2 = @lab_1.scientists.create!(name: "William Birkin", specialty: "Epidemiology", university: "Johns Hopkins")
    @scientist_3 = @lab_2.scientists.create!(name: "Annette Birkin", specialty: "Virology", university: "Johns Hopkins")

    @experiment_1 = @scientist_1.experiments.create!(name: "T Virus", objective: "Create a self-propagating, bloodborne virus that transforms the hosts into durable bio-weapons.", num_months: 18)
    @experiment_2 = @scientist_2.experiments.create!(name: "G Virus", objective: "Create a retrovirus that transforms hosts into bio-weapons with greater combat capability than T Virus hosts.", num_months: 24)
    @experiment_3 = @scientist_1.experiments.create!(name: "T-Veronica Virus", objective: "Create a virus that morphs host psychology to resemble an ant colony.", num_months: 5)

    visit lab_experiments_path(@lab_1)
  end

  it "shows all long running experiments (longer than 6 months)" do
    expect(page).to have_content(@experiment_1.name)
    expect(page).to have_content(@experiment_2.name)
    expect(page).to_not have_content(@experiment_3.name)

    expect(@experiment_2.name).to appear_before(@experiment_1.name)
  end
end
  