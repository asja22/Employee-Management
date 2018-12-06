module DeviseHelper
 
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    
    <div class="alert alert-danger">
      <table width="30%">
        <tr><td><h2>#{sentence}</h2><td></tr>
      <tr><td><ul>#{messages}</ul></td></tr>
      </table>
    </div>
    
    HTML

    html.html_safe
  end
end