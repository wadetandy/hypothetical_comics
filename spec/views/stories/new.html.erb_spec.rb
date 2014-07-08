require 'rails_helper'

RSpec.describe "stories/new", :type => :view do
  before(:each) do
    assign(:story, Story.new(
      :text => "MyText",
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders new story form" do
    render

    assert_select "form[action=?][method=?]", stories_path, "post" do

      assert_select "textarea#story_text[name=?]", "story[text]"

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "input#story_user_id[name=?]", "story[user_id]"
    end
  end
end
