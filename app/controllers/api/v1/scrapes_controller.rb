class Api::V1::ScrapesController < ApplicationController
  def index
    @scrapes = Scrape.includes(:tags).page(params[:page])
    render 'index.json.jbuilder', status: 200
  end

  def create
    scrape = Scrape.find_or_initialize_by(url: params[:url])
    return success if scrape.cached?

    if scrape.save
      ScrapeJob.perform_later(scrape.id)
      success
    else
      failure
    end
  end

  private

  def success
    render json: { status: 'success' }, status: 200
  end

  def failure
    render json: { status: 'failure' }, status: 422
  end
end
