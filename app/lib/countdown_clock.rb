class CountdownClock
  def initialize(date)
    @date = Date.parse(date.to_s)
  end

  def days_left
    (@date - Date.today).to_i
  end

  def show_countdown?
    days_left.positive?
  end

  def days_text
    days_left == 1 ? "day" : "days"
  end
end
