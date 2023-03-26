require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    assign(:movie, Movie.create!(
      title: "Title",
      describe: "Describe",
      gender: "Gender"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Describe/)
    expect(rendered).to match(/Gender/)
  end
end
