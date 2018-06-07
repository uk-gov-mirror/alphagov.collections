module Api
  class OrganisationsController < ApplicationController
    def index
      js = [
        {
          content_id: SecureRandom.uuid
          title: 'Organisations'
        },
        {
          content_id: SecureRandom.uuid
          title: 'E Organisations'
        }
      ]

      respond_with js
    end
  end
end
