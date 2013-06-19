casper = require('casper').create()


casper.start 'http://localhost:3000', ->
  @test.assertTitle 'Sand'

# Ensure form and appropriate inputs exist
casper.then ->
  @test.assertSelectorExists '.standup-form'
  @test.assertSelectorExists '.standup-form select'
  options = @evaluate ->
    document.querySelectorAll('.standup-form select option')
  @test.assertEquals options.length, 3, 'There should be 3 options'
  textareas = @evaluate ->
    document.querySelectorAll('.standup-form textarea')
  @test.assertEquals textareas.length, 3, 'There should be 3 textareas'
  @test.assertSelectorExists '.standup-form input'

# Execute Casper commands
casper.run ->
  @test.renderResults true
