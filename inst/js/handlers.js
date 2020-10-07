$( document ).ready(function() {
  Shiny.addCustomMessageHandler('add_mousetrap_binding', function(arg) {
    Mousetrap.bind(arg.keys, function() {
      Shiny.setInputValue(arg.id, arg.keys, {priority: 'event'});
    });
  })
  Shiny.addCustomMessageHandler('remove_mousetrap_binding', function(arg) {
    Mousetrap.unbind(arg.keys);
  })
  Shiny.addCustomMessageHandler('mousetrap_pause', function(arg) {
    Mousetrap.pause();
  })
  Shiny.addCustomMessageHandler('mousetrap_unpause', function(arg) {
    Mousetrap.unpause();
  })
});
