module ApplicationHelper

  def tealeaf
    '<span class="glyphicon glyphicon-leaf"></span> Tealeaf Academy'.html_safe
  end

  def close_button(alert_or_modal)
    button_tag(:button, class: "close", data: { dismiss: alert_or_modal }, aria: { hidden: "true" }) do
      '&times;'.html_safe
    end
  end

  def project_statuses(project)
    if project.team?
      ["hiring","in-progress","finished"]
    else
      ["in-progress","finished"]
    end
  end

  def job_statuses
    ["in progress","completed"]
  end

  def pretty_time(time)
    if logged_in? && !current_user.time_zone.blank?
      time = time.in_time_zone(current_user.time_zone)
    end
    time.strftime("%m/%d/%Y %I:%M%P %Z")
  end

  def pretty_date(date)
    if logged_in? && !current_user.time_zone.blank?
      date = date.in_time_zone(current_user.time_zone)
    end
    date.strftime("%m/%d/%Y")
  end

  def fix_url(str)
    if str.blank?
      "<em> URL was not specified.</em>".html_safe
    else
      if str.start_with?('http') 
        link_to(str, str) 
      else
        link_to(str, "http://#{str}")
      end
    end
  end
end
