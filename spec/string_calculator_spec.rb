require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number itself when only one number is provided" do
      expect(StringCalculator.add("1")).to eq(1)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,5")).to eq(6)
    end

    it "returns the sum of multiple numbers" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it "handles new lines as delimiters along with commas" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiter with a newline after `//`" do
      expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
    end

    it "supports custom delimiter without a newline" do
      expect(StringCalculator.add("//|5|6|4")).to eq(15)
    end

    it "supports various special characters as delimiters" do
      expect(StringCalculator.add("//.\n1.2.3")).to eq(6)
      expect(StringCalculator.add("//@\n4@5@6")).to eq(15)
      expect(StringCalculator.add("//#\n3#3#3")).to eq(9)
      expect(StringCalculator.add("//$\n2$8$10")).to eq(20)
      expect(StringCalculator.add("//%\n5%5%5")).to eq(15)
      expect(StringCalculator.add("//^\n4^4^4")).to eq(12)
      expect(StringCalculator.add("//&\n7&3&2")).to eq(12)
    end

    it "raises an exception when negative numbers are present with default delimiter" do
      expect { StringCalculator.add("1,-2,3,-4") }.to raise_error(RuntimeError, "Negative numbers not allowed: -2, -4")
    end
    
    it "raises an exception when negative numbers are present with a custom delimiter" do
      expect { StringCalculator.add("//;\n1;-2;3;-4") }.to raise_error(RuntimeError, "Negative numbers not allowed: -2, -4")
    end
    
    it "raises an exception when negative numbers are present with a special character delimiter" do
      expect { StringCalculator.add("//|\n1|-2|3|-4") }.to raise_error(RuntimeError, "Negative numbers not allowed: -2, -4")
    end
  end
end
