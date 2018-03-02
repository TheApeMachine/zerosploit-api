class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :handle
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
  end
end
