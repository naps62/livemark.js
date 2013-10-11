class @Livemark
  container: undefined
  converter: undefined

  template: """
  <div class='livemark__container'>
    <div class='livemark__header'></div>
    <div class='livemark__editor-wrap'>
      <h2>Editor</h2>
      <textarea class='livemark__editor'>
        asd\n# asd\n# asd\n# asd\n# asd\n# asd
      </textarea>
    </div>
    <div class='livemark__preview-wrap'>
      <h2>Preview</h2>
      <div class='livemark__preview'></div>
    </div>
    <div class='livemark__clearfix'></div>
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
