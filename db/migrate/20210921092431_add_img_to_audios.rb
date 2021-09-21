class AddImgToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :img, :string
  end
end
