class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  # nameカラムにpresence: trueを設ける事で空の場合はDBに保存しないと言う
  # バリデーションを設定しています。 
#   オブジェクトがDBに保存される前に、そのデータが正しいかどうかを検証する仕組みを
# バリデーションというpresence: trueは検証結果がtrueであればエラーを出さないよと言うこと
# つまりnemeカラムが空でないこと
  has_many :room_users
  # 一人のuserは一人のユーザーに紐づくroomを複数持っている
  has_many :rooms, through: :room_users
  # 一人userは複数のroomwをもち。経由してroom_usersテーブルで管理する
end