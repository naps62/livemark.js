class @Livemark
  container: undefined
  converter: undefined

  template: """
  <div class='livemark__container'>
    <div class='livemark__header'></div>
    <div class='livemark__editor-wrap'>
      <textarea class='livemark__editor' placeholder='Type markdown here'></textarea>
    </div><div class='livemark__preview-wrap'>
      <div class='livemark__preview'></div>
    </div>
    <div class='livemark__footer'></div>
  </div>
  """

  constructor: (context) ->
    @context = $(context)
    @setup()
    @converter = new LivemarkConverter(@src, @dst)
    @converter.listen()

  setup: ->
    @context.html(@template)
    @container = @context.find('.livemark__container')
    @src = @context.find('.livemark__editor')
    @dst = @context.find('.livemark__preview')
    console.log "asd"
    @container.resizable()
    console.log @container
    console.log "asd"
