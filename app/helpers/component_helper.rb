module ComponentHelper

  def ui_side_menu_link(text, path, active: false, separated: false, link_params: {})
    li_classes = ['pure-menu-item']
    li_classes << 'pure-menu-selected' if active
    li_classes << 'menu-item-divided' if separated
    content_tag :li, class: li_classes do
      link_to text, path, link_params.merge(class: 'pure-menu-link')
    end
  end

end
