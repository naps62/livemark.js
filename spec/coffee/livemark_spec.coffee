describe 'Livemark', ->

  beforeEach ->
    fixture = $('<div id="livemark"></div>')
    $('body').append(fixture)
    @livemark = new Livemark '#livemark'

  describe '#constructor', ->
    it 'instantiates a converter', ->
      expect(@livemark.converter).toEqual jasmine.any(LivemarkConverter)

    it 'adds a textarea to the container', ->
      expect($('#livemark')).toContain 'textarea'

    it 'adds a preview div to the container', ->
      expect($('#livemark')).toContain '.livemark__preview'
