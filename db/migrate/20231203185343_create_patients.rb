class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :pesel
      t.date :date_of_birth
      t.string :city

      t.timestamps
    end
  end
end
