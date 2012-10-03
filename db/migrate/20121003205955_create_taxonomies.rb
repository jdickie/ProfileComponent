class CreateTaxonomies < ActiveRecord::Migration
  def change
    create_table :taxonomies do |t|
      t.string :name
      t.string :description
      
      t.timestamps
    end
  end
end
