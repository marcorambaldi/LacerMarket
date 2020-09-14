class AddAttachmentCoverToContents < ActiveRecord::Migration[5.2]
  def self.up
    change_table :contents do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :contents, :cover
  end
end
