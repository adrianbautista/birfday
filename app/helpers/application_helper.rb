module ApplicationHelper
  def title(page_title)
    content_for :title, page_title.to_s.upcase
  end

  def birthday_boolean
    @birthday.date_born == Date.today ? 'YES' : 'NO'
  end
end
