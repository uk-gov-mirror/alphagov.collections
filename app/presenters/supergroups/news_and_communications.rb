module Supergroups
  class NewsAndCommunications < Supergroup
    attr_reader :content

    DEFAULT_PLACEHOLDER_IMAGE = "#{Plek.new.public_asset_host}/government/assets/placeholder.jpg".freeze

    def initialize
      super('news_and_communications')
    end

    def tagged_content(taxon_id)
      @content = MostRecentContent.fetch(content_id: taxon_id, filter_content_purpose_supergroup: @name)
    end

    def promoted_content(taxon_id)
      items = tagged_content(taxon_id).shift(promoted_content_count)

      format_image_card_data(items, "ImageCardClicked")
    end

    def news_item_photo(base_path)
      default_news_image = {
        "url": DEFAULT_PLACEHOLDER_IMAGE
      }.with_indifferent_access

      news_item = ::Services.content_store.content_item(base_path)

      news_item["details"]["image"] || default_news_image
    end

  private

    def promoted_content_count(*)
      1
    end

    def format_image_card_data(documents, data_category = "")
      documents.each.with_index(1).map do |document, index|
        document_image = news_item_photo(document.base_path)

        data = {
          link: {
            text: document.title,
            path: document.base_path,
            data_attributes: data_attributes(document.base_path, document.title, index)
          },
          metadata: {
            public_updated_at: document.public_updated_at,
            organisations: document.organisations,
            document_type: document.content_store_document_type.humanize
          },
          image: {
            url: document_image["url"]
          }
        }

        if data_category.present?
          data[:link][:data_attributes][:track_category] = data_module_label + data_category
        end

        data
      end
    end

    def document_type(document)
      document.content_store_document_type.humanize
    end

    def updated_date(document)
      document.public_updated_at.strftime('%e %B %Y')
    end
  end
end
