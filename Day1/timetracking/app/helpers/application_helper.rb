module ApplicationHelper

  def flash_message
    display_message(:notice) || display_message(:alert)
  end

  def current_month_hours_for_project(project, date)
    project.total_hours_in_month(date[:month], date[:year])
  end

  private
  def display_message(type)
    if flash[type]
      content_tag :div, class: "message #{type.to_s}" do
        content_tag :p do
          flash[type]
        end
      end
    end
  end

end
