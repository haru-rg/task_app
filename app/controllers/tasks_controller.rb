class TasksController < ApplicationController

  def index
    @tasks=Task.all
    @date = Date.today.strftime("%Y年%m月%d日")
    @quantity = Task.count
  end
  def new
    @task = Task.new
    @date = Date.today.strftime("%Y年%m月%d日")
  end

  def create
    @date = Date.today.strftime("%Y年%m月%d日")
    @task= Task.new(params.require(:task).permit(:title, :startdate, :finishtime, :allday, :memo))
    if @task.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :tasks
    else
      flash[:notice] = "スケジュールを登録できませんでした"
      render "new"
    end
  end

  def show
    @date = Date.today.strftime("%Y年%m月%d日")
    @task = Task.find(params[:id])
  end

  def edit
    @date = Date.today.strftime("%Y年%m月%d日")
    @task = Task.find(params[:id])

  end

  def update
    @date = Date.today.strftime("%Y年%m月%d日")
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :startdate, :finishtime, :allday, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:notice] = "スケジュールを更新できませんでした"
      render "edit"
    end
  end

  def destroy
    def destroy
      @task = Task.find(params[:id])
      @task.destroy
      flash[:notice] = "スケジュールを削除しました"
      redirect_to :tasks
    end
  end
end