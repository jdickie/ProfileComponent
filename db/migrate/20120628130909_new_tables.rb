class NewTables < ActiveRecord::Migration
  def up
    create_table :awards, :force => true do |t|
      t.string :award_name, :institution
      t.timestamps
    end
    
    create_table :awards_notes, :id => false do |t|
      t.integer :awards_id
      t.integer :notes_id
    end
    
    create_table :leaves, :force => true do |t|
      t.string :reason
      t.integer :banked_courses_used
      t.timestamps
    end
    
    create_table :leaves_notes, :id => false do |t|
      t.integer :leaves_id
      t.integer :notes_id
    end
    
    create_table :publications, :force => true do |t|
      t.string :title, :publisher
      t.string :role
      t.timestamps
    end
    
    create_table :notes_publications, :id => false do |t|
      t.integer :publications_id
      t.integer :notes_id
    end
    
    create_table :research_periods do |t|
      t.text :description
      t.string :area_group, :keyword
    end
  end

  def down
    drop_table :awards
    drop_table :awards_notes
    drop_table :leaves
    drop_table :leaves_notes
  end
end