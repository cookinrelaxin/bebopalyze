'use strict';

require('../semantic/dist/semantic.min.css');
require('../semantic/dist/semantic.min.js');

require('./index.html');

var Elm = require('./Main.elm');
var mountNode = document.getElementById('main');

var app = Elm.Main.embed(mountNode);

var isFirstDropdown = true;

/*
 * $('#buttonTypeSelection')
 *   .dropdown()
 * ;
 */

/*
 * app.ports.openDropdown.subscribe( function(dropdownId) {
 *   // ugly javascript induced hack
 *   $('#' + dropdownId)
 *     .dropdown()
 *   ;
 *   console.log("dropdownId: ", dropdownId);
 * });
 */
