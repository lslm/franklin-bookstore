class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :street
      t.string :number
      t.string :zip_code
      t.string :city
      t.string :state
      t.string :type

      t.timestamps
    end
  end
end
