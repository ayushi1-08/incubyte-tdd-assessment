class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    
    # Check if the input starts with custom delimiter syntax
    if numbers.start_with?("//")
      match = numbers.match(%r{//(.+?)\n?(.*)})  # Match custom delimiter format
      delimiter = Regexp.escape(match[1])        # Extract and escape delimiter
      numbers = match[2]                         # Extract the number string
    end

    # Allow both new lines (`\n`) and the extracted delimiter
    numbers = numbers.split(/[\n#{delimiter}]/).map(&:to_i)

    # Detect negative numbers
    negatives = numbers.select { |n| n.negative? }
    raise "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?

    numbers.sum
  end
end
