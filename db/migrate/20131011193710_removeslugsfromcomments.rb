class Removeslugsfromcomments < ActiveRecord::Migration
  def change
    remove_column :comments, :slugs
  end
end
