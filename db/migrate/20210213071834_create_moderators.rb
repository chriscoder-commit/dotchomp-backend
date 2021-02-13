class CreateModerators < ActiveRecord::Migration[6.0]
  def change
    create_table :moderators do |t|

      t.timestamps
    end
  end
end
