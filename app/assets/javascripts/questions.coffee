# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on("ready page:load", ->

  $("#new_question").on("keyup", (event)->
    form = $("#new_question")

    request = $.ajax({
        url: "/questions/preview"
        type: "post"
        data: $(this).serialize()
      })

    request.done (response) ->
      $(".preview").html(response.content)
  )

)
