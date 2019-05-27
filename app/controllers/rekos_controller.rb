class RekosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @rekos = Reko.where(receiver_id: current_user.id)
  end
end
