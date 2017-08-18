module RecipeHelper

  def button_to_toggle_recipe_flag(recipe)
    if @recipe.flag
      active_class = 'active'
      http_method = :delete
    else
      active_class = nil
      http_method = :post
    end

    content_tag(:div, id: 'RecipeFlag', class: "recipe-flag #{active_class}", refresh: 'recipe-flag') do
      form_tag(
        recipe_flag_path(@recipe),
        method: http_method,
        'tg-remote' => 1,
        'refresh-on-success' => 'recipe-flag'
      ) do
        button_tag(){ fa_icon('star') }
      end
    end
  end
end
