class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    if numbers.start_with?("//")
      match = numbers.match(%r{//(.+?)\n?(.*)}) # Supports optional newline
      delimiter = match[1]                      # Extract the delimiter
      numbers = match[2]                        # Extract number string
    else
      delimiter = ","
    end

    # Split using both new line (`\n`) and the custom delimiter
    numbers = numbers.split(/[\n#{Regexp.escape(delimiter)}]/).map(&:to_i)
    numbers.sum
  end
end
