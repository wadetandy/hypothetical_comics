require 'rails_helper'

RSpec.describe "stories/edit", :type => :view do
  before(:each) do
    @story = assign(:story, Story.create!(
      :text => "MyText",
      :title => "MyString",
      :user => nil
    ))
  end

  it "renders the edit story form" do
    render

    assert_select "form[action=?][method=?]", story_path(@story), "post" do

      assert_select "textarea#story_text[name=?]", "story[text]"

      assert_select "input#story_title[name=?]", "story[title]"

      assert_select "input#story_user_id[name=?]", "story[user_id]"
    end
  end
end
