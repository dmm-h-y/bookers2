class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

    t.string :title
    t.string :body
    #あと1つ追記する(課題3確認)
    #カラム追加コマンドrails5章確認

      t.timestamps
    end
  end
end
