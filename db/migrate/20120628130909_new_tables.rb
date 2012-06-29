class NewTables < ActiveRecord::Migration
  def up
    create_table :awards_period, :force => true do |t|
      t.string :time_type, :presence => "True"
      t.references :calendar_dates
      t.references :awards
      t.timestamps
    end
    
    create_table :awards_notes, :id => false do |t|
      t.integer :awards_id
      t.integer :notes_id
    end
    
    create_table :leaves_notes, :id => false do |t|
      t.integer :leaves_id
      t.integer :notes_id
    end
    
    create_table :notes_publications, :id => false do |t|
      t.integer :publications_id
      t.integer :notes_id
    end
    
    create_table :notes_research_periods, :id => false do |t|
      t.integer :notes_id
      t.integer :research_periods_id
    end
    
    create_table :keywords do |t|
      t.string :keyword_name
      t.timestamps
    end
    
    create_table :keywords_research_periods, :id => false do |t|
      t.integer :keywords_id
      t.integer :research_periods_id
    end
    
  end

  def down
    drop_table :awards_notes
    drop_table :leaves_notes
    drop_table :notes_publications
    drop_table :notes_research_periods
    drop_table :keywords
    drop_table :keywords_research_periods
  end
end