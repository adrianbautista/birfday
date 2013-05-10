class BirthdaysController < ApplicationController

  def index
  end

  def new
    @birthday = Birthday.new
  end

  def create
    @birthday = Birthday.new(params[:birthday])
    @birthday.set_twitter_handle if params[:birthday][:twitter_url]
    @birthday.url_hash = SecureRandom.hex(10)
    if @birthday.save
      redirect_to @birthday
    else
      render :new
    end
  end

  def show
    @birthday = Birthday.find(params[:id])
  end
end
