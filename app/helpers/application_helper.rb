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

  def breadcrumb(current, crumbs={})
    content_tag('div', class: 'rw-row page-breadcrumb') do
      [
        link_to('Home', root_path),
        crumbs.map{|text, link| link_to(text, link)},
        content_tag('span', current)
      ].flatten.join(' &raquo; ').html_safe
    end.html_safe
  end

end
