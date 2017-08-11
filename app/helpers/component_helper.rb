module ComponentHelper

  def ui_side_menu_link(text, path, active: false, separated: false, disabled: false, link_params: {})
    li_classes = ['pure-menu-item']
    li_classes << 'pure-menu-selected' if active
    li_classes << 'pure-menu-disabled' if disabled
    li_classes << 'menu-item-divided' if separated
    content_tag :li, class: li_classes do
      link_to text, path, link_params.merge(class: 'pure-menu-link')
    end
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

  def ui_content_section(title:, &block)
    ui_content_title(title) + capture(&block)
  end

end
