class AddContentTypeToDataFiles < ActiveRecord::Migration
  def change
    add_column :data_files, :content_type, :string

  end
end
