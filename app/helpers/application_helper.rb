module ApplicationHelper

  def tealeaf
    '<span class="glyphicon glyphicon-leaf"></span> Tealeaf Academy'.html_safe
  end

  def close_button(alert_or_modal)
    button_tag(:button, class: "close", data: { dismiss: alert_or_modal }, aria: { hidden: "true" }) do
      '&times;'.html_safe
    end
  end
end
