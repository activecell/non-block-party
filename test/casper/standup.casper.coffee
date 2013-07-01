casper = require('casper').create()

casper.start 'http://localhost:3000', ->
  @test.assertTitle 'Sand'

casper.then ->
  @echo "======Ensure form and appropriate inputs exist======"

  @test.assertSelectorExists '.standup-form'
  @test.assertSelectorExists '.standup-form select'
  options = @evaluate -> $('.standup-form select option')
  @test.assertEquals options.length, 3, 'There should be 3 options'
  $textareas = @evaluate -> $('.standup-form textarea')

  @test.assertEquals $textareas.length, 3, 'There should be 3 textareas'
  @test.assertSelectorExists '.standup-form input[type=submit]'

casper.then ->
  @echo "======Fill the form======"
  @fill '.standup-form',
    status: 'Yellow'
    today: 'Today is the day'
    tomorrow: 'Tomorrow is Today'
    questions: '?uesto of the roots'

casper.then ->
  @echo "======Check that the form is filled======"
  form = @getFormValues '.standup-form'
  @test.assertEquals form.status, 'Yellow', 'status should equal: Yellow'
  @test.assertEquals form.today, 'Today is the day', 'today should equal: Today is the day'
  @test.assertEquals form.tomorrow, 'Tomorrow is Today', 'tomorrow should equal: Tomorrow is Today'
  @test.assertEquals form.questions, '?uesto of the roots', 'questions should equal: ?uesto of the roots'

casper.then ->
  @echo "======Submit the form======"
  @evaluate -> $('.standup-form input[type=submit]').submit()
  @echo 'Form Submitted'

casper.waitForSelector '.updates-table', ->
  @echo "======Ensure table appears and url is /updates======"
  @test.assertVisible '.updates-table'
  @test.assertUrlMatch /updates/, 'Current url is /updates'
  @test.assertSelectorHasText '.updates-table tr td', 'Yellow'
  @test.assertSelectorHasText '.updates-table tr td', 'Today is the day'
  @test.assertSelectorHasText '.updates-table tr td', 'Tomorrow is Today'
  @test.assertSelectorHasText '.updates-table tr td', '?uesto of the roots'


# Execute Casper commands
casper.run ->
  @test.renderResults true
