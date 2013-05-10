module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s.upcase
  end

  def birthday_boolean
    @birthday.date_born == Date.today ? 'YES' : 'NO'
  end

  def congratulate
    if birthday_boolean == 'YES'
      render partial: 'birthdays/tweet', locals: { handle: @birthday.twitter_url, url_site: birthday_url(@birthday) }
    end
  end
end
