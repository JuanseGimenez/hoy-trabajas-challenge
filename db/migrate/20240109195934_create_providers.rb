class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :name, null: false
      t.string :nit, null: false, limit: 11
      t.string :contact_name, null: false
      t.string :contact_phone, limit: 10

      t.timestamps
    end
  end
end
