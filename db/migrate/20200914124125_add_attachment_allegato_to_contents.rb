class AddAttachmentAllegatoToContents < ActiveRecord::Migration[5.2]
  def self.up
    change_table :contents do |t|
      t.attachment :allegato
    end
  end

  def self.down
    remove_attachment :contents, :allegato
  end
end
