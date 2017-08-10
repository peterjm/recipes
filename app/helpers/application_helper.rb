module ApplicationHelper

  def application_name
    "Recipes @ 424"
  end

  def head_title
    prefix = "DEV " if Rails.env.development?
    title = page_title ? "#{application_name}: #{page_title}" : application_name
    [prefix, title].join(' ')
  end

  def page_title
    @page_title
  end

  def set_page_title(title)
    @page_title = title
  end

  def string_to_dom_id(str)
    str.titleize.gsub(/\s/, '')
  end

  def home?
    controller_name == 'home' && action_name == 'index'
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

  def avatar_url
    email = Rails.application.secrets.google_account.downcase.strip
    email_hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{email_hash}.jpg?s=50"
  end

end
