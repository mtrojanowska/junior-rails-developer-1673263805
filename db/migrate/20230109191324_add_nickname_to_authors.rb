class AddNicknameToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :nickname, :string, null: false
  end
end
