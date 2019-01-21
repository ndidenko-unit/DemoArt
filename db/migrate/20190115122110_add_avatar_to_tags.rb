class AddAvatarToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :avatar, :string
  end
end
