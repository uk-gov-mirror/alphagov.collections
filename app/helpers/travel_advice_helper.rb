require 'htmlentities'

module TravelAdviceHelper
  def group_by_initial_letter(countries)
    groups = countries.group_by do |country|
      country.name[0] if country&.name
    end

    groups.sort_by { |name, _| name }
  end

  def format_atom_change_description(text)
    # Encode basic entities([<>&'"]) as named, the rest as decimal
    simple_format(HTMLEntities.new.encode(text, :basic, :decimal))
  end

  def page_title(publication = nil)
    title = publication.title if publication
    [title, 'GOV.UK'].select(&:present?).join(" - ")
  end

  def wrapper_class(publication = nil)
    services = %W[transaction local_transaction completed_transaction place]
    html_classes = []

    if publication
      if publication.respond_to?(:wrapper_classes)
        html_classes = publication.wrapper_classes
      else
        if publication.format
          html_classes << publication.format
        end

        if services.include? publication.format
          html_classes << "service"
        end
      end
    end

    html_classes.join(' ')
  end
end
