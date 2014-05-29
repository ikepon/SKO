class AddAttachmentExePdfToLessons < ActiveRecord::Migration
  def self.up
    change_table :lessons do |t|
      t.attachment :exe_pdf
    end
  end

  def self.down
    drop_attached_file :lessons, :exe_pdf
  end
end
