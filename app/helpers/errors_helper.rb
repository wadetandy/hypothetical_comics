module ErrorsHelper
  def flash_errors(model)
    content_tag(:ul) do
      model.errors.full_messages.each do |msg|
        content_tag :li, msg
      end
    end
  end
end
