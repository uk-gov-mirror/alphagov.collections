class PeopleController < ApplicationController
  include LocaleHelper

  def show
    @person = Person.find!(request.path)
    @lang_att = language_attribute(@person.locale.presence)
    @dir_att = direction_attribute(@person.locale.presence)
    setup_content_item_and_navigation_helpers(@person)
    render :show, locals: {
      person: @person,
    }
  end
end
