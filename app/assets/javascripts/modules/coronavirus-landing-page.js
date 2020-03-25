window.GOVUK = window.GOVUK || {}
window.GOVUK.Modules = window.GOVUK.Modules || {};

(function (Modules) {
  "use strict";

  Modules.CoronavirusLandingPage = function () {
    this.start = function () {
      // Confirm the user is on the coronavirus landing page
      if (window.location.pathname === "/coronavirus") {
        if (GOVUK.cookie("global_bar_seen")) {
          // Get current version of global bar, if cookie has been set
          var currentBannerVersion = JSON.parse(GOVUK.cookie("global_bar_seen")).version

          // Automatically hide the additional information section in the banner by setting the cookie
          GOVUK.setCookie("global_bar_seen", JSON.stringify({"count": 999, "version": currentBannerVersion}), {days: 84})
        }
      }
    }
  }
})(window.GOVUK.Modules)
