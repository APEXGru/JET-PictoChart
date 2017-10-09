! function (jet, $, server, util, debug) {
    "use strict";

    jet.picto = {
        init: function (pRegionId, pApexAjaxIdentifier) {
            require(["ojs/ojcore", "jquery", "ojs/ojpictochart"], function (oj, $) {
                server.plugin(pApexAjaxIdentifier, {}, {
                    success: function (pData) {
                        $(pRegionId)
                            .ojPictoChart(pData);
                    }
                });
            });
        }
    }
}(window.jet = window.jet || {}, apex.jQuery, apex.server, apex.util, apex.debug);