class CreateRatingsTable < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.timestamps null: false
    end

    create_table :ratings do |t|
      t.belongs_to :student, index: true
      t.belongs_to :internship, index: true
      t.integer :company_rating
      t.integer :project_rating
      t.integer :personality_rating
      t.timestamps null: false
    end
  end
end
