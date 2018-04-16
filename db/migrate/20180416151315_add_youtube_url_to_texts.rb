class AddYoutubeUrlToTexts < ActiveRecord::Migration[5.1]
  def change
    add_column :texts, :url, :string
  end
end
