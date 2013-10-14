class AddSlugsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :slugs, :string
  end
end
