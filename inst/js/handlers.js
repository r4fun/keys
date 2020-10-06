$( document ).ready(function() {
  Shiny.addCustomMessageHandler('add_mousetrap_binding', function(arg) {
    Mousetrap.bind(arg.keys, function() {
      Shiny.setInputValue(arg.id, arg.keys, {priority: 'event'});
    });
  })
  Shiny.addCustomMessageHandler('remove_mousetrap_binding', function(arg) {
    Mousetrap.unbind(arg.keys);
  })
});
