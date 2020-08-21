class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      #もしユーザーの情報を更新できたら（user＿params:nameと：emailを含んだ情報）
      redirect_to root_path
      # root_path(チャット画面)へ遷移して
    else
      render :edit
      # ユーザーの情報を更新できなかったらrender edit(ユーザー情報編集画面へ遷移して)
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
