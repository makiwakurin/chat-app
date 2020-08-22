class RoomUser < ApplicationRecord
  belongs_to :room
  # 一つのuserに紐づく一つのroomは一つのroomに所属する
  belongs_to :user
#  一つのroomに紐づく一つのuserは一つのuserに所属する
#  一対一の関係
end
