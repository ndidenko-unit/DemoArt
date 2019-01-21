# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#cropbox').Jcrop
      setSelect: [30, 30, 100, 100]
      onSelect: @update
      onChange: @update
      minSize: [20, 20],
      maxSize: [200, 200]

  update: (coords) =>
    $('#picture_crop_x').val(coords.x)
    $('#picture_crop_y').val(coords.y)
    $('#picture_crop_w').val(coords.w)
    $('#picture_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#preview').css
      width: Math.round(10 * coords.w + 'px')
      height: Math.round(10 * coords.h  + 'px')
      marginLeft: '-' + Math.round(300/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(300/coords.h * coords.y) + 'px'
