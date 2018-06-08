require "test_helper"

module Api
  describe BrowseController do

    def organisations
      JSON.parse(
        File.read(
          File.expand_path( "./test/fixtures/content_store/api/organisations.json")
        )
      )
    end


    describe "GET index" do
      before do
        content_store_has_item("/government/organisations",
          organisations
        )
      end

      it "set correct expiry headers" do
        get :index

        assert_equal "max-age=1800, public", response.headers["Cache-Control"]
      end
    end
  end
end
