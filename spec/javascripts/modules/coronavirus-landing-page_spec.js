describe('Coronavirus landing page', function () {

  var coronavirusLandingPage;

  beforeEach(function () {
    coronavirusLandingPage = new GOVUK.Modules.CoronavirusLandingPage();
  })

  it("sets the global_bar_seen cookie to 999 if on coronavirus landing page", function () {
    GOVUK.setCookie("global_bar_seen", JSON.stringify({"count": 0, "version": 1}))

    coronavirusLandingPage.start()

    expect(JSON.parse(GOVUK.cookie("global_bar_seen")).count).toBe(999)
  })
});
