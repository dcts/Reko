class ShortenLinksController < ApplicationController
  def show
    @shorten_link = ShortenLink.find(params[:id])
    redirect_to @shorten_link.link
  end
end
