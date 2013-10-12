class @LivemarkConverter

  constructor: (src, dst) ->
    @src = $(src)
    @dst = $(dst)
    @showdown = new Showdown.converter({ extensions: [
        'github',
        'twitter',
        'table'
    ]})

  convert: ->
    @input = @src.val()
    @output = @showdown.makeHtml(@input)

  display: ->
    @dst.html(@output)

  listen: ->
    @src.on 'keyup', (event) =>
      @convert()
      @display()
    @src.trigger 'keyup'
