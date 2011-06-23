class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.date :date_of_birth
      t.string :gender
      t.string :ethnicity
      t.string :unique_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end
