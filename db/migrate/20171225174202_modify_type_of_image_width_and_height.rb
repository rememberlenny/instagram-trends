class ModifyTypeOfImageWidthAndHeight < ActiveRecord::Migration[5.1]
  def change
    change_column :instagram_images, :dimensions_height, 'integer USING CAST(dimensions_height AS integer)'
    change_column :instagram_images, :dimensions_width, 'integer USING CAST(dimensions_width AS integer)'
  end
end
