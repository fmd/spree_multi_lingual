class MigrateDataForProducts < ActiveRecord::Migration
  def up
    Spree::Product.transaction do
      Spree::Product.find_each do |product|
        Spree::Config[:track_inventory_levels] = false
        product.update_attributes!(product.untranslated_attributes, :without_protection => true)
        Spree::Config[:track_inventory_levels] = true
      end
    end
  end

  def down
  end
end