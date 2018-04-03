class CreateAttractions < ActiveRecord::Migration
    create_table :attractions do |t|
        t.string :name
        t.integer :nausea_rating
        t.integer :happiness_rating
        t.integer :tickets
        t.integer :min_height
    end
end
