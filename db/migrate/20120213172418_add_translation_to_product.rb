class AddTranslationToProduct < ActiveRecord::Migration
  def up
  Spree::Config[:track_inventory_levels] = false
  Spree::Product.create_translation_table! :name => :string, :description => :text, :meta_description => :string, :meta_keywords => :string
  Spree::Config[:track_inventory_levels] = true
  end

  def down
    Spree::Product.drop_translation_table!
  end  
end