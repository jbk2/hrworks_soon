module UsersHelper

  def greet(hour_of_clock)
    if hour_of_clock >= 1 && hour_of_clock <= 11
      "Morning"
    elsif hour_of_clock >= 12 && hour_of_clock <= 16
      "Afternoon"
    else
      "Evening"
    end
  end

end
