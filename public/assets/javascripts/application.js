/**
 * application.js
 * 
 * Code Club Style Guide - A collection of UI components for styling Code Club websites
 * @version v0.0.1-0
 * @link https://styleguide.codeclubworld.org/
 */
'use strict';

/**
 * application.js
 *
 *= require_self
 */

$(document).ready(function () {

  $('.toggle_drawer').click(function () {
    $('body').toggleClass('drawer_toggle');
    return false;
  });

  $('.toggle').click(function () {
    $(this).next().toggleClass('hidden');
    $(this).toggleClass('down');
  });
});
//# sourceMappingURL=application.js.map
