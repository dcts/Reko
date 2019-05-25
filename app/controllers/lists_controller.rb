class ListsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end
end
