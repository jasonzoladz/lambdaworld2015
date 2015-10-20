"use strict";

module.exports.handler = function(event, context) {
	return require("Main").lambda(event)(context)();
}
