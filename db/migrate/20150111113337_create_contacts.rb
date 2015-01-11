class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email
      t.string :telephone
      t.text :address

      t.timestamps null: false
    end
  end
end
