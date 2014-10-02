module IconsHelper
  def icon_tag(icon_class)
    content_tag :i, nil, class: "fa #{icon_class}"
  end
end
