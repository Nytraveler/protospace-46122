class UsersController < ApplicationController
  def show
    # URLの/users/:id からidを取得して該当ユーザーを特定
    @user = User.find(params[:id])

    # そのユーザーが投稿したプロトタイプ一覧を取得
    @prototypes = @user.prototypes
  end
end