class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index_all, :index]

  def index_all
    @rekos = Reko.all
  end

  def index
    # @rekos =
  end
end
