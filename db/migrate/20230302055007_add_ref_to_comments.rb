class AddRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :posts, null: false, foreign_key: true
    add_reference :comments, :users, null: false, foreign_key: true
  end
end
