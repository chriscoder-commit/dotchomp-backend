class AddUserRefToModerator < ActiveRecord::Migration[6.0]
  def change
    add_reference :moderators, :user, null: false, foreign_key: true
  end
end
