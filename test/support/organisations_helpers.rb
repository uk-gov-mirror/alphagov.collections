module OrganisationsHelpers
  # TODO: maybe remove this given the bottom methods
  def content_store_organisations_fixture
    JSON.parse(
      File.read(
        File.expand_path( "./test/fixtures/content_store/api/organisations.json")
      )
    ).with_indifferent_access
  end

  def content_store_ministerial_department_fixture
    content_store_organisations_fixture[:details][:ordered_ministerial_departments].second
  end

  def expected_whitehall_organisation
    {
      "id": "https://www.gov.uk/api/organisations/cabinet-office",
      "title": "Cabinet Office",
      "format": "Ministerial department",
      "updated_at": "2018-01-09T10:07:57.000+00:00",
      "web_url": "https://www.gov.uk/government/organisations/cabinet-office",
      "details": {
        "slug": "cabinet-office",
        "abbreviation": "",
        "logo_formatted_name": "Cabinet Office",
        "organisation_brand_colour_class_name": "cabinet-office",
        "organisation_logo_type_class_name": "single-identity",
        "closed_at": nil,
        "govuk_status": "live",
        "govuk_closed_status": nil,
        "content_id": "96ae61d6-c2a1-48cb-8e67-da9d105ae381"
      },
      "analytics_identifier": "D2",
      "parent_organisations": [

      ],
      "child_organisations": [
        {
          "id": "https://www.gov.uk/api/organisations/the-committee-on-standards-in-public-life",
          "web_url": "https://www.gov.uk/government/organisations/the-committee-on-standards-in-public-life"
        },
        {
          "id": "https://www.gov.uk/api/organisations/the-office-of-the-leader-of-the-house-of-commons",
          "web_url": "https://www.gov.uk/government/organisations/the-office-of-the-leader-of-the-house-of-commons"
        },
      ],
      "superseded_organisations": [

      ],
      "superseding_organisations": [

      ]
    }
  end


  def ministerial_departments_hash
    {
      "title": "Departments, agencies and public bodies",
      details: {
        ordered_executive_offices: [
          {
            title: "Prime Minister's Office, 10 Downing Street",
            href: "/government/organisations/prime-ministers-office-10-downing-street",
            brand: "cabinet-office",
            logo: {
              formatted_title: "Prime Minister's Office, 10 Downing Street",
              crest: "eo"
            }
          }
        ],
        ordered_ministerial_departments: [
          {
            title: "Attorney General's Office",
            href: "/government/organisations/attorney-generals-office"
          },
        ],
        ordered_non_ministerial_departments: [],
        ordered_agencies_and_other_public_bodies: [],
        ordered_high_profile_groups: [],
        ordered_public_corporations: [],
        ordered_devolved_administrations: []
      }
    }.with_indifferent_access
  end

  def non_ministerial_departments_hash
    {
      "title": "Departments, agencies and public bodies",
      details: {
        ordered_executive_offices: [],
        ordered_ministerial_departments: [],
        ordered_non_ministerial_departments: [
          {
            title: "The Charity Commission",
            href: "/government/organisations/charity-commission",
            brand: "department-for-business-innovation-skills",
            separate_website: true
          }
        ],
        ordered_agencies_and_other_public_bodies: [
          {
            title: "Academy for Social Justice Commissioning",
            href: "/government/organisations/academy-for-social-justice-commissioning",
            brand: "ministry-of-justice",
          }
        ],
        ordered_high_profile_groups: [
          {
            title: "Bona Vacantia",
            href: "/government/organisations/bona-vacantia",
            brand: "attorney-generals-office",
          }
        ],
        ordered_public_corporations: [
          {
            title: "BBC",
            href: "/government/organisations/bbc",
            brand: "department-for-culture-media-sport",
          }
        ],
        ordered_devolved_administrations: [
          {
            title: "Northern Ireland Executive ",
            href: "/government/organisations/northern-ireland-executive",
            brand: nil
          }
        ]
      }
    }.with_indifferent_access
  end

  def some_non_ministerial_departments_hash
    {
      "title": "Departments, agencies and public bodies",
      details: {
        ordered_executive_offices: [],
        ordered_ministerial_departments: [],
        ordered_non_ministerial_departments: [
          {
            title: "The Charity Commission",
            href: "/government/organisations/charity-commission",
            brand: "department-for-business-innovation-skills",
          }
        ]
      }
    }.with_indifferent_access
  end
end
