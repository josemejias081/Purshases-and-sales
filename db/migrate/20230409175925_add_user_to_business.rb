class AddUserToBusiness < ActiveRecord::Migration[7.0]
  def change
    add_reference :businesses, :user, null: false, foreign_key: true
  end
end
