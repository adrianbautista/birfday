$ ->
  verdict = $('h1.verdict')
  verdict.fitText(0.2)
  verdictText = if checkBirthday(verdict) == true then "YES" else "NO"
  verdict.text(verdictText)

checkBirthday = (domElement) ->
  date = domElement.data('date')
  now = moment()
  momentDate = moment(date, 'MM-DD')
  momentDate.isSame(now, 'day')

