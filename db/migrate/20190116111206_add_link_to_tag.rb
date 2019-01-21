class AddLinkToTag < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :link, :string
  end
end
