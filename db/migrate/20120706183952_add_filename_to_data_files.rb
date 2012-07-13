class AddFilenameToDataFiles < ActiveRecord::Migration
  def change
    add_column :data_files, :filename, :string

  end
end
