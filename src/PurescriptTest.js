"use strict";

// module PurescriptTest

/**
 * Adds a new atom command to the 'text-editor' view.
 */
exports.addTextEditorCommand = function(name) {
  return function(command) {
    return function() {
      var cmd = {};
      cmd[name] = command;
      atom.commands.add('atom-text-editor', cmd);
    };
  };
};

/**
 * Helper to work around Purescript's inability to customise what is exported.
 *
 * Specifically exports whatever is passed to it when run. This can be used
 * to export the basic Atom package functions/callbacks.
 */
exports.expose = function(exportedPackage) {
  return function() {
    module.exports = exportedPackage;
  };
};
