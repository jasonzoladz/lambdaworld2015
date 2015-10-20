/* global exports */
"use strict";

// module Network.Aws.Lambda.Function

exports.failure = function (context) {
    return function (error) {
        return function () {
            context.done(error, null);
            return {};
        };
    };
};

exports.succImpl = function (context) {
    return function (object) {
        return function () {
            context.done(null, object);
            return {};
        };
    };
};
