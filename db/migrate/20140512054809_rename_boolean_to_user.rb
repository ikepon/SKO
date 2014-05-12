class RenameBooleanToUser < ActiveRecord::Migration
  def up
    rename_column :users, :boolean, :mailmag
    #   呪文     :テーブル名, :旧カラム名, :新カラム名
  end

  def down
    rename_column :users, :mailmag, :boolean
    #   呪文     :テーブル名, :新カラム名, :旧カラム名
  end
end
