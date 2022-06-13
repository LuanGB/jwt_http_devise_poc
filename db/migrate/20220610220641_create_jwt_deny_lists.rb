class CreateJwtDenyLists < ActiveRecord::Migration[7.0]
  def change
    create_table :jwt_deny_lists do |t|
      t.integer :exp
      t.string :token

      t.timestamps
    end
  end
end
