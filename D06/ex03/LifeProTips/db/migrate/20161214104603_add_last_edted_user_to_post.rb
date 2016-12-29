class AddLastEdtedUserToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :last_edition, :string
  end
end
