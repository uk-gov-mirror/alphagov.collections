module Api
  class OrganisationsController < ApplicationController
    ORGANISATIONS_BASE_PATH = "/government/organisations".freeze
    ORGANISATIONS_CONTENT_ID = "fde62e52-dfb6-42ae-b336-2c4faf068101".freeze

    def index
      # TODO:
      # - pagination
      # - content_item details hash
      # - presentation 

      @content_item = ContentItem.find!(ORGANISATIONS_BASE_PATH)

      render json: @content_item
    end
  end
end
