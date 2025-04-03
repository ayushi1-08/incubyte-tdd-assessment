class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    return numbers.to_i if numbers.match?(/^\d+$/) # Handles single number / checking

    numbers.split(",").map(&:to_i).sum # Handles two numbers
  end
end
