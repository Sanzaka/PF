class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, only:[:edit, :update]

  # current_userが関連しないページへのアクセスを制限する処理
  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:alert] = "閲覧権限がありません！"
      redirect_to user_path(current_user)
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      flash[:notice] = "変更を保存しました！"
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = "変更に失敗しました！"
      render "edit"
    end
  end

  def show
    @user = User.find(current_user.id)
    @target = Target.new
    @group_ranks = Group.find(GroupMember.group(:group_id).order("count(group_id) desc").limit(3).pluck(:group_id))
  end

  def quick_form
    @my_groups = current_user.groups.where(group_type: "work_group").page(params[:page]).per(10)
    @new_target = Target.new
    @result = Result.new
  end

  # 退会処理
  def secession
    user = User.find(params[:id])
    user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理が完了しました。ご利用ありがとうございました！"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :intro, :image)
  end
end
