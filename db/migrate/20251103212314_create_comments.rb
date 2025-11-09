# db/migrate/2025xxxxxx_create_comments.rb
class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content, null: false             # コメント本文
      t.references :user, null: false, foreign_key: true  # ユーザー関連付け
      t.references :prototype, null: false, foreign_key: true  # プロトタイプ関連付け

      t.timestamps
    end
  end
end