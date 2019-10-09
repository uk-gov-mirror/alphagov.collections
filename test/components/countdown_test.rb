require "component_test_helper"

class CountdownTest < ComponentTestCase
  def component_name
    "countdown"
  end

  test "renders nothing without a date" do
    assert_empty render_component({})
  end

  test "renders with a blank date name if none is provided" do
    render_component(date: Date.tomorrow)

    assert_select ".app-c-countdown"
  end

  test "renders a countdown with a date name" do
    render_component(date: Date.tomorrow, date_name: "Christmas")

    assert_select ".app-c-countdown__title", text: "Christmas"
  end
end
