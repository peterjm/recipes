namespace :development do
  namespace :fake_data do
    task :all => :environment do
      ENV['SOURCE_COUNT'].to_i.times do
        Rake::Task["development:fake_data:source"].execute
      end
      ENV['RECIPE_COUNT'].to_i.times do
        Rake::Task["development:fake_data:recipe"].execute
      end
    end

    task :source => :environment do
      source = Source.create(
        name: Faker::Book.title,
        author: Faker::Name.name,
        source_type: Source::TYPES.sample,
        description: Faker::Lorem.paragraph,
      )
      source.url = Faker::Internet.url if source.source_type == Source::WEBSITE_TYPE
      source.save
    end

    task :recipe => :environment do
      Recipe.create!(
        title: fake_recipe_name,
        ingredients_text: fake_ingredients_text,
        instructions_text: fake_instructions_text,
        notes: fake_notes,
        source: random_source,
        images_attributes: fake_image_attributes,
        update_recipe_ingredients_on_save: true,
        update_primary_image_on_save: true
      )
    end

    task :ingredient_names do
    end

    def fake_recipe_name
      Faker::Food.dish
    end

    def fake_ingredients_text
      number(1,10).times.map{ fake_ingredient_line }.join("\n")
    end

    def fake_instructions_text
      Faker::Lorem.paragraphs(number(1, 6)).join("\n\n")
    end

    def fake_notes
      Faker::Lorem.paragraph if boolean(0.6)
    end

    def random_source
      Source.all.sample if boolean(0.8)
    end

    def fake_image_attributes
      return [] if boolean(0.1)
      number(1,5).times.map {
        { source_image_url: Faker::LoremPixel.image("1024x768") }
      }
    end

    def fake_ingredient_line
      line = "#{Faker::Food.measurement} #{fake_ingredient_name}"
      line += ", #{Faker::Lorem.sentence.gsub('.', '')}" if boolean(0.4)
      line += " (#{Faker::Lorem.sentence.gsub('.', '')})"if boolean(0.1)
      line
    end

    def fake_ingredient_name
      (0.8) ? Faker::Food.ingredient : Faker::Food.spice
    end

    def number(low, high)
      Faker::Number.between(low, high)
    end

    def boolean(true_percent)
      Faker::Boolean.boolean(true_percent)
    end
  end
end
