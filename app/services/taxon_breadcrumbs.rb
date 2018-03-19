class TaxonBreadcrumbs
  def initialize(content_item)
    @content_item = TaxonBreadcrumbs::ContentItem.new(content_item)
  end

  def breadcrumbs
    ordered_parents = all_parents.map.with_index do |parent, index|
      {
        title: parent.title,
        url: parent.base_path,
        is_page_parent: index.zero?
      }
    end

    ordered_parents << {
      title: "Home",
      url: "/",
      is_page_parent: ordered_parents.empty?
    }

    ordered_parents.reverse
  end

private

  attr_reader :content_item

  def all_parents
    parents = []

    direct_parent = content_item.parent_taxon
    while direct_parent
      parents << direct_parent
      direct_parent = direct_parent.parent_taxon
    end

    parents
  end

  class ContentItem
    attr_reader :content_item

    def initialize(content_item)
      @content_item = content_item.to_h
    end

    def parent
      parent_item = content_item.dig("links", "parent", 0)
      return unless parent_item
      ContentItem.new(parent_item)
    end

    def parent_taxon
      # TODO: Determine what to do when there are multiple taxons/parents. For
      # now just display the first of each.
      parent_taxons.sort_by(&:title).first
    end

    def parent_taxons
      @_parent_taxons ||= begin
        taxon_links
          .select { |t| phase_is_live?(t) }
          .map { |taxon| ContentItem.new(taxon) }.sort_by(&:title)
      end
    end

    def phase_is_live?(taxon)
      taxon["phase"] == "live"
    end

    def title
      content_item.fetch("title")
    end

    def base_path
      content_item.fetch("base_path")
    end

  private

    def taxon_links
      content_item.dig("links", "parent_taxons") || []
    end

    def filter_link_type(links, type)
      links.select do |link|
        link["document_type"] == type
      end
    end
  end
end
