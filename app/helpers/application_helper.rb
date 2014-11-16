module ApplicationHelper

  def tealeaf
    '<span class="glyphicon glyphicon-leaf"></span> Tealeaf Academy'.html_safe
  end

  def close_button(alert_or_modal)
    button_tag(:button, class: "close", data: { dismiss: alert_or_modal }, aria: { hidden: "true" }) do
      '&times;'.html_safe
    end
  end

  def pretty_time(time)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end
    time.strftime("%m/%d/%Y %I:%M%P %Z")
  end
end
