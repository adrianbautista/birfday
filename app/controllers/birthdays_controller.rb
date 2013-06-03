class BirthdaysController < ApplicationController

  def index
    @lucky_one = Birthday.select { |x| x.date_born_today? }.sample
  end

  def new
    @birthday = Birthday.new
  end

  def create
    @birthday = Birthday.new(params[:birthday])
    @birthday.set_twitter_handle if params[:birthday][:twitter_url]
    @birthday.url_hash = SecureRandom.hex(3)
    if @birthday.save
      begin
        Twitter.update(@birthday.twitter_message + " #{birthday_url(@birthday)}")
      end
      redirect_to @birthday
    else
      render :new
    end
  end

  def show
    @birthday = Birthday.find(params[:id])
  end
end
