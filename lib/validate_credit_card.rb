# frozen_string_literal: true

class ValidateCreditCard
  def validate(num)
    return nil if num.nil?
    raise_argument_error(num)
    return true if (sum_doubled_digit(num) % 10).zero?
    false
  end

  def raise_argument_error(arg)
    raise ArgumentError, 'Invalid Credit Card Number' if arg.digits.count > 16 
  end

  def sum_doubled_digit(num)
    num = num.to_s.chars.map(&:to_i)
    doubled_num = []
    num.each_with_index do |n, i|
      if can_double_the_digit?(i, num.length)
        double_the_digits(n, doubled_num) if can_double_the_digit?(i, num.length)
      else
        doubled_num.push(n)
      end
    end
    doubled_num.sum
  end

  private

  def double_the_digits(num, doubled)
    double = num * 2
    doubled_digits = doubled
    return doubled_digits.push(num) if double > 9
    doubled_digits.push(double)
  end

  def can_double_the_digit?(index, num_length)
    index % 2 == step(num_length)
  end

  def step(num_length)
    return 0 if (num_length % 2).zero?
    1
  end
end
