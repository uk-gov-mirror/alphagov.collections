class RolesController < ApplicationController
  include LocaleHelper

  def show
    @role = Role.find!(request.path)
    @lang_att = language_attribute(@role.locale.presence)
    @dir_att = direction_attribute(@role.locale.presence)
    setup_content_item_and_navigation_helpers(@role)
    render :show, locals: {
      role: @role,
    }
  end
end
