require "test_helper"

module Api
  describe BrowseController do

    describe "GET index" do
      before do
        content_store_has_item("/browse",
          links: {
            top_level_browse_pages: top_level_browse_pages
          }
        )
      end

      it "set correct expiry headers" do
        get :index

        assert_equal "max-age=1800, public", response.headers["Cache-Control"]
      end
    end
  end
end
