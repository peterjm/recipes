module ApplicationHelper

  def application_name
    "Recipes by Peter"
  end

  def head_title
    page_title ? "#{application_name}: #{page_title}" : application_name
  end

  def page_title
    @page_title
  end

  def set_page_title(title)
    @page_title = title
  end

  def home?
    controller_name == 'recipes' && action_name == 'index'
  end

end
