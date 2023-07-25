# モデルなどの処理はコントローラに書くこと！
class ListsController < ApplicationController
  def new
    @list = List.new
    # List.newの意味はリストモデルの情報をもとにnew（新規作成）するって意味だよ！
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end
  
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
