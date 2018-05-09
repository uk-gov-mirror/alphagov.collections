require 'gds_api/helpers'

class TravelAdviceController < ApplicationController
  enable_request_formats index: [:atom]

  slimmer_template 'wrapper'
  layout 'travel_advice'
  include GdsApi::Helpers

  FOREIGN_TRAVEL_ADVICE_SLUG = 'foreign-travel-advice'.freeze

  def index
    set_expiry
    setup_content_item("/" + FOREIGN_TRAVEL_ADVICE_SLUG)
    @presenter = TravelAdviceIndexPresenter.new(@content_item)

    respond_to do |format|
      format.html { render locals: { full_width: true } }
      format.atom do
        set_expiry(5.minutes)
        headers["Access-Control-Allow-Origin"] = "*"
      end
    end
  end

private

  def setup_content_item(base_path)
    begin
      @content_item = content_store.content_item(base_path).to_hash
      section_name = @content_item.dig("links", "parent", 0, "links", "parent", 0, "title")
      if section_name
        @meta_section = section_name.downcase
      end
    rescue GdsApi::HTTPNotFound, GdsApi::HTTPGone
      @content_item = nil
      @meta_section = nil
    end
  end
end
