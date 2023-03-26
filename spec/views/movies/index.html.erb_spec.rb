require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        title: "Title",
        describe: "Describe",
        gender: "Gender"
      ),
      Movie.create!(
        title: "Title",
        describe: "Describe",
        gender: "Gender"
      )
    ])
  end

  it "renders a list of movies" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Describe".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Gender".to_s), count: 2
  end
end
