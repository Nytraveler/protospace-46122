class AddProfileFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    change_table :users, bulk: true do |t|
      t.string :name
      t.text   :profile
      t.text   :occupation
      t.text   :position
    end
  end
end
