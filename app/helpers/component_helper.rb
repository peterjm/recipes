module ComponentHelper

  def ui_button(text, path, size: 'normal')
    button_class = case size
    when 'xlarge'
      'button-xlarge'
    end

    link_to(text, path, class: "pure-button pure-button-primary #{button_class}")
  end

  def ui_side_menu_link(text, path, active: false, separated: false, disabled: false, link_params: {})
    li_classes = ['pure-menu-item']
    li_classes << 'pure-menu-selected' if active
    li_classes << 'pure-menu-disabled' if disabled
    li_classes << 'menu-item-divided' if separated
    content_tag :li, class: li_classes do
      link_to text, path, link_params.merge(class: 'pure-menu-link')
    end
  end

  def ui_content_container(grid_size_small: 1, grid_size_big: 1, &block)
    current_grid_size_stack.push({
      small: grid_size_small,
      big: grid_size_big
    })
    content = content_tag(:div, class: 'pure-g', &block)
    current_grid_size_stack.pop
    content
  end

  def ui_editable_content_section(title:, object:, field:, &block)
    render(layout: 'shared/inplace_editor', locals: { title: title, object: object, field: field }, &block)
  end

  def ui_content_title(title=nil, &block)
    if block_given?
      content_tag(:h2, class: 'content-subhead', &block)
    else
      content_tag(:h2, title, class: 'content-subhead')
    end
  end

  def ui_content_section(title: nil, grid_size_small: 1, grid_size_big: 1, &block)
    content = if title
      ui_content_title(title) + capture(&block)
    else
      capture(&block)
    end

    grid_classes = [
      grid_class(grid_size_small, current_grid_sizes[:small]),
      grid_class(grid_size_big, current_grid_sizes[:big], 'sm')
    ].uniq

    content_tag(:div, content, class: grid_classes)
  end

  def current_grid_size_stack
    @current_grid_size_stack ||= []
  end

  def current_grid_sizes
    current_grid_size_stack.last
  end

  def grid_class(element_size, grid_size, media_size=nil)
    raise "element too large for grid" if element_size > grid_size

    if media_size
      "pure-u-#{media_size}-#{element_size}-#{grid_size}"
    else media_size
      "pure-u-#{element_size}-#{grid_size}"
    end
  end

end
