class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
      t.string :email_acquirente
      t.string :email_venditore
      t.string :guid
      t.integer :content_id

      t.timestamps
    end
  end
end
