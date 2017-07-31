class Api::V1::ScrapesController < ApplicationController
  def create
    scrape = Scrape.find_or_initialize_by(url: params[:url])

    if scrape.save
      ScrapeJob.perform_later(scrape.id)
      render json: { status: 'success' }, status: 200
    else
      render json: { status: 'failure' }, status: 422
    end
  end
end