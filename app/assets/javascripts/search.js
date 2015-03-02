$(document).ready(function() {
  $("[role=search]").on('submit', function(e) {
    // e.preventDefault();
    var query = $("[role=search] input")
    console.log(query[0].value);
  })
})
