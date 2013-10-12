class @Livemark
  container: undefined
  converter: undefined

  template: """
    <div class='livemark__header'></div>
    <div class='livemark__editor-wrap'>
      <textarea class='livemark__editor' placeholder='Type markdown here...'></textarea>
    </div><div class='livemark__preview-wrap'>
      <div class='livemark__preview'></div>
    </div>
    <div class='livemark__footer'></div>
  """

  constructor: (container) ->
    @container = $(container)
    @setup()
    @converter = new LivemarkConverter(@src, @dst)
    @converter.listen()

  setup: ->
    @container.addClass('livemark__container')
    @container.html(@template)
    @src = @container.find('.livemark__editor')
    @dst = @container.find('.livemark__preview')
