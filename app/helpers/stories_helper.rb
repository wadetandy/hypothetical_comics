module StoriesHelper
  def edit_story_button(story)
    if story.user == current_user
      link_to story_path(story), :class => 'btn btn-xs', title: 'Edit Story' do
        content_tag(:i, nil, class: 'fa fa-pencil')
      end
    end
  end
end
