class Room < ApplicationRecord
  has_many :room_users
  # 一つの部屋には一つのroom_idに紐づくuser_idが複数ある
  has_many :users, through: :room_users
  # 一つの部屋には複数のuserがいて。経由してroom_usersで管理する
end
