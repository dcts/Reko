class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @rekos = Reko.all
  end
end
