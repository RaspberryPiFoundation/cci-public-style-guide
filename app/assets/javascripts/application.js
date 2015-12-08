/**
 * application.js
 *
 *= require_self
 */

$( document ).ready(function() {

 $('.toggle_drawer').click(function() {
   $('body').toggleClass('drawer_toggle');
   return false;
 });

 $('.toggle').click(function() {
  $(this).next().toggleClass('hidden');
  $(this).toggleClass('down');
 });

});
