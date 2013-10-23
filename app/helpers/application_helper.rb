module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s.upcase
  end

  def birthday_presenter
    @birthday.date_born.strftime('%m-%d')
  end

  def congratulate
    if @birthday.date_born == Date.today && @birthday.twitter_url.present?
      render partial: 'birthdays/tweet', locals: { handle: @birthday.twitter_url, url_site: birthday_url(@birthday) }
    end
  end

  def show_lucky_one
    if @lucky_one
      link_to "it's #{@lucky_one.name}'s birthday today", birthday_path(@lucky_one)
    else
      "seems like no one was born today"
    end
  end
end
