module CitizenReadiness
  class TaxonLinkPresenter
    attr_reader :taxon_content_item
    delegate(
      :title,
      :base_path,
      to: :taxon_content_item
    )

    def initialize(taxon_content_item, index = nil)
      @taxon_content_item = taxon_content_item
      @index = index
    end

    def description
      I18n.t("campaign.taxon_descriptions.#{base_path.delete('/')}")
    end

    def link
      "/prepare-eu-exit#{base_path}"
    end

    def data_attributes
      {
        "track-category": "navGridContentClicked",
        "track-action": @index,
        "track-label": title
      }
    end
  end
end
