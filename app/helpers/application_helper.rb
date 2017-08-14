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

  def page_heading
    @page_heading
  end

  def set_page_title(title, heading: true)
    @page_title = title
    @page_heading = title if heading
  end

  def string_to_dom_id(str)
    str.titleize.gsub(/\s/, '')
  end

  def home?
    controller_name == 'home' && action_name == 'index'
  end

  def avatar_url
    email = Rails.application.secrets.google_account.downcase.strip
    email_hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{email_hash}.jpg?s=50"
  end

  def recipes_section?
    controller_name == 'recipes' && action_name.in?(%w(index show edit))
  end

  def ingredients_section?
    controller_name == 'ingredients' && action_name.in?(%w(index show edit))
  end

  def sources_section?
    controller_name == 'sources' && action_name.in?(%w(index show edit))
  end

  def new_recipe_section?
    controller_name == 'recipes' && action_name == 'new'
  end

  def new_source_section?
    controller_name == 'sources' && action_name == 'new'
  end

end
