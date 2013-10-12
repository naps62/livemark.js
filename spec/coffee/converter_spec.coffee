describe 'LivemarkConverter', ->

  beforeEach ->
    fixture = $('<div id="fixture"><textarea id="input"></textarea> <div id="output"></div></div>')
    $('body').append(fixture)
    @converter = new LivemarkConverter '#input', '#output'

  afterEach ->
    $('#fixture').remove()

  describe '#contructor', ->
    it 'finds the source', ->
      expect(@converter.src).toBe 'textarea'

    it 'finds the destination', ->
      expect(@converter.dst).toBe 'div'

  describe '#convert', ->
    it 'converts markdown titles', ->
      set_input '# title'
      output = $(@converter.convert())
      expect(output).toBe 'h1'

    it 'converts twitter handles to urls', ->
      set_input '@naps62'
      output = $(@converter.convert())
      expect(output).toContain 'a[href="http://twitter.com/naps62"]'

  describe 'github extension', ->
    it 'handles deleted text', ->
      set_input '~~deleted text~~'
      output = $(@converter.convert())
      expect(output).toContain 'del'

  describe 'table extension', ->
    it 'handles tables', ->
      set_input '|col1|col2|\n|===|===|'
      output = $(@converter.convert())
      expect(output).toBe 'table'


  describe '#display', ->
    it 'shows the output', ->
      set_input 'foo bar'
      @converter.convert()
      @converter.display()
      expect($('#output')).toHaveText('foo bar')

  describe '#listen', ->
    it 'listens to changes and updates output', ->
      @converter.listen()
      set_input 'foo bar'
      $('#input').trigger($.Event('keyup'))
      expect($('#output')).toHaveText('foo bar')

set_input = (input) ->
  $('#input').val(input)
