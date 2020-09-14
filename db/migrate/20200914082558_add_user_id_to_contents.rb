class AddUserIdToContents < ActiveRecord::Migration[5.2]
  def change
    add_column :contents, :user_id, :integer
  end
end
