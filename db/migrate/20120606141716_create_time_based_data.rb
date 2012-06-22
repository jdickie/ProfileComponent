class CreateTimeBasedData < ActiveRecord::Migration
  def change
    create_table :fundings do |t|
      t.string :institution
      t.text :description
      t.references :people
      t.references :calendar_dates
    end
    
    create_table :leaves do |t|
      t.integer :banked_courses_used
      t.references :people
      t.references :calendar_dates
    end
    
    create_table :research_periods do |t|
      t.text :description
      t.string :area_group
      t.references :people
      t.references :calendar_dates
    end
    
    create_table :awards do |t|
      t.string :name, :institution
      t.references :people
      t.references :calendar_dates
    end
    
    create_table :publications do |t|
      t.string :title, :publisher, :role
      t.references :people
      t.references :calendar_dates
    end
  end
end
