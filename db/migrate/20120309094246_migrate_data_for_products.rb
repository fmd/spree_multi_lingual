class MigrateDataForProducts < ActiveRecord::Migration
  def up
    Spree::Product.transaction do
      Spree::Product.find_each do |product|
        producttemp = product.untranslated_attributes.reject!{ |k| k == "count_on_hand"}
        producttemp = producttemp.reject!{ |k| k == "on_demand"}
        product.update_attributes!(producttemp, :without_protection => true)
      end
    end
  end

  def down
  end
end