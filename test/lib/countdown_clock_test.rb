require "test_helper"

describe CountdownClock do
  describe "CountdownClock" do
    it "calculates the number of days left" do
      countdown_clock = CountdownClock.new(Date.tomorrow)

      assert_equal(1, countdown_clock.days_left)
    end

    it "handles dates in the past" do
      countdown_clock = CountdownClock.new(Date.yesterday)

      assert_equal(-1, countdown_clock.days_left)
    end

    it "returns 0 if the day is today" do
      countdown_clock = CountdownClock.new(Date.today)

      assert_equal(0, countdown_clock.days_left)
    end

    it "shows the countdown if the date is in the future" do
      countdown_clock = CountdownClock.new(Date.tomorrow)

      assert_equal(true, countdown_clock.show_countdown?)
    end

    it "hides the countdown if the date is in the past" do
      countdown_clock = CountdownClock.new(Date.yesterday)

      assert_equal(false, countdown_clock.show_countdown?)
    end

    it "hides the countdown if the date is today" do
      countdown_clock = CountdownClock.new(Date.today)

      assert_equal(false, countdown_clock.show_countdown?)
    end

    it "displays day if there is only one day left" do
      countdown_clock = CountdownClock.new(Date.tomorrow)

      assert_equal("day", countdown_clock.days_text)
    end

    it "displays day if there are multiple days left" do
      countdown_clock = CountdownClock.new(Date.tomorrow + 5)

      assert_equal("days", countdown_clock.days_text)
    end
  end
end
