namespace :recipes do
  task :rebuild_ingredients => :environment do
    Recipe.find_each(&:update_recipe_ingredients)
    Ingredient.find_each.select{|i| i.recipes.count.zero?}.each(&:destroy)
  end
end
