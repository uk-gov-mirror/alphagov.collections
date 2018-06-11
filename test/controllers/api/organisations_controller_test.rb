require "test_helper"

module Api
  describe OrganisationsController do

    def content_store_organisations
      JSON.parse(
        File.read(
          File.expand_path( "./test/fixtures/content_store/api/organisations.json")
        )
      )
    end


    def whitehall_api_organisations
      {
        "results": [
          {
            "id": "https://www.gov.uk/api/organisations/attorney-generals-office",
            "title": "Attorney General's Office",
            "format": "Ministerial department",
            "updated_at": "2017-11-22T14:32:25.000+00:00",
            "web_url": "https://www.gov.uk/government/organisations/attorney-generals-office",
            "details": {
              "slug": "attorney-generals-office",
              "abbreviation": "AGO",
              "logo_formatted_name": "Attorney \r\nGeneral's \r\nOffice",
              "organisation_brand_colour_class_name": "attorney-generals-office",
              "organisation_logo_type_class_name": "single-identity",
              "closed_at": nil,
              "govuk_status": "live",
              "govuk_closed_status": nil,
              "content_id": "25aacd68-dc0c-4041-9c3a-df59a5357c23"
            },
            "analytics_identifier": "D1",
            "parent_organisations": [

            ],
            "child_organisations": [
              {
                "id": "https://www.gov.uk/api/organisations/treasury-solicitor-s-department",
                "web_url": "https://www.gov.uk/government/organisations/treasury-solicitor-s-department"
              },
              {
                "id": "https://www.gov.uk/api/organisations/crown-prosecution-service",
                "web_url": "https://www.gov.uk/government/organisations/crown-prosecution-service"
              },
              {
                "id": "https://www.gov.uk/api/organisations/serious-fraud-office",
                "web_url": "https://www.gov.uk/government/organisations/serious-fraud-office"
              },
              {
                "id": "https://www.gov.uk/api/organisations/hm-crown-prosecution-service-inspectorate",
                "web_url": "https://www.gov.uk/government/organisations/hm-crown-prosecution-service-inspectorate"
              },
              {
                "id": "https://www.gov.uk/api/organisations/government-legal-department",
                "web_url": "https://www.gov.uk/government/organisations/government-legal-department"
              }
            ],
            "superseded_organisations": [

            ],
            "superseding_organisations": [

            ]
          },
        ]
      }
    end



    describe "GET index" do
      before do
        content_store_has_item("/government/organisations", content_store_organisations)
      end

      it "set correct expiry headers" do
        get :index

        r = JSON.parse(response.body)

        assert_equal r, whitehall_api_organisations
      end
    end
  end
end
