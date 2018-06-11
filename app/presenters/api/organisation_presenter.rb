module Api
  class OrganisationPresenter
    def initialize(organisation)
      @content_item = ContentItem.find!(organisation[:href])
    end

    def present
      {
        id: id,
        title: title,
        format: org_format,
        updated_at: updated_at,
        web_url: web_url,
        details: details,
        analytics_identifier: analytics_identifier,
        parent_organisations: parent_organisations,
        child_organisations: child_organisations,
        superseded_organisations: superseded_organisations,
        superseding_organisations: superseding_organisations
      }
    end

  private
    attr_reader :content_item

    def id
      "https://www.gov.uk/api/content#{content_item[:href]}"
    end

    def title
      content_item[:title]
    end

    def org_format
      # TODO
      # "Ministerial department"
      content_item[:format]
    end

    def updated_at
      # TODO
      content_item[:updated_at]
    end

    def web_url
      content_item[:web_url]
    end

    def details
      {
        "slug": slug,
        "abbreviation": abbreviation,
        "logo_formatted_name": logo_formatted_name,
        "organisation_brand_colour_class_name": organisation_brand_colour_class_name,
        "organisation_logo_type_class_name": organisation_logo_type_class_name,
        "closed_at": closed_at,
        "govuk_status": govuk_status,
        "govuk_closed_status": govuk_closed_status,
        "content_id": content_id
      }
    end

    def content_id
      content_item[:details][:content_id]
    end

    def slug
      content_item[:details][:slug]

      # /government/organisations/attorney-generals-office
    end

    def abbreviation
      content_item[:details][:abbreviation]
    end

    def logo_formatted_name
      content_item[:details][:logo_formatted_name]
    end

    def organisation_brand_colour_class_name
      content_item[:details][:organisation_brand_colour_class_name]
    end

    def organisation_logo_type_class_name
      content_item[:details][:organisation_logo_type_class_name]
    end

    def closed_at
      content_item[:details][:closed_at]
    end

    def govuk_status
      content_item[:details][:govuk_status]
    end

    def govuk_closed_status
      content_item[:details][:govuk_closed_status]
    end

    def analytics_identifier
      content_item[:analytics_identifier]
    end

    def parent_organisations
      content_item[:parent_organisations]
    end

    def child_organisations
      content_item[:child_organisations]
      [
        {
          "id": "https://www.gov.uk/api/organisations/treasury-solicitor-s-department",
          "web_url": "https://www.gov.uk/government/organisations/treasury-solicitor-s-department"
        },
      ]
    end

    def superseded_organisations
      content_item[:superseded_organisations]
    end

    def superseding_organisations
      data[:superseding_organisations]
    end
  end
end
