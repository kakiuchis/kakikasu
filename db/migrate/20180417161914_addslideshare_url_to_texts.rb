class AddslideshareUrlToTexts < ActiveRecord::Migration[5.1]
  def change
  	add_column :texts, :slideshare_url, :string
  end
end
