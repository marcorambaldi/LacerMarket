class AddSlugToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :slug, :string
    add_index :contents, :slug, unique: true
  end
end
