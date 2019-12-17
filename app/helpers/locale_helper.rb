module LocaleHelper
  def language_attribute locale
    "lang=#{locale}" unless I18n.default_locale.to_s == locale.to_s
  end

  def direction_attribute locale
    direction = page_text_direction(locale)
    "dir=#{direction}" unless direction == "ltr"
  end

  private

    def page_text_direction locale
      I18n.t("shared.language_direction.#{locale}", default: "ltr")
    end
end
