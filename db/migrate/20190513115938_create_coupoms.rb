class CreateCoupoms < ActiveRecord::Migration[5.2]
  def change
    create_table :coupoms do |t|
      t.references :user
      t.string :code
      t.decimal :value
      t.boolean :used

      t.timestamps
    end
  end
end
