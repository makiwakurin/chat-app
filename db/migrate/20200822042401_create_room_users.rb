class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_users do |t|
      t.references :room, foreign_key: true
      # 外部キーを使用する際はreferencesを使う
      t.references :user, foreign_key: true
      # ここに保存するユーザーとチャットグループは存在してる事が前提
      # なのでusersテーブルとroomsテーブルの情報を参照する必要がある。
      # この参照する役割を果たすのがforeign_key: true
      t.timestamps
    end
  end
end
