class CreateChomps < ActiveRecord::Migration[6.0]
  def change
    create_table :chomps do |t|

      t.timestamps
    end
  end
end
