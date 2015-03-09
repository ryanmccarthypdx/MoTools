class CreateInternships < ActiveRecord::Migration
  def change
    create_table(:internships) do |t|
      t.string :company_name
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :company_website
      t.string :company_address
      t.string :company_description
      t.string :intern_work
      t.string :intern_ideal
      t.string :intern_count
      t.boolean :intern_clearance
      t.string :intern_clearance_description
      t.string :mentor_name
      t.string :mentor_email
      t.string :mentor_phone
    end
  end
end
