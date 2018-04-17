class RenameUrlColumnToTexts < ActiveRecord::Migration[5.1]
  def change
  	rename_column :texts, :url, :youtube_code
  end
end
