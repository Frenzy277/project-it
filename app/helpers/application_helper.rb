module ApplicationHelper

  def tealeaf
    '<span class="glyphicon glyphicon-leaf"></span> Tealeaf Academy'.html_safe
  end

  def close_button(alert_or_modal)
    content_tag(:button, 
                content_tag(:span, nil, class: "glyphicon glyphicon-remove-circle"), 
                class: "close", 
                data: { dismiss: alert_or_modal }, 
                aria: { hidden: "true" })
  end
end
