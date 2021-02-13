class AddUserRefToChomps < ActiveRecord::Migration[6.0]
  def change
    add_reference :chomps, :user, null: false, foreign_key: true
  end
end
