# frozen_string_literal: true

require 'validate_credit_card'

describe ValidateCreditCard do
  it 'can return empty string when nil passed' do
    expect(described_class.new.validate(nil)).to eq(nil)
  end

  it 'can raise Argument error when no argument passed' do
    expect { described_class.new.validate }.to raise_error(ArgumentError)
  end

  it 'can raise Argument error when more than 16 digits passed' do
    expect { described_class.new.validate(12_345_678_912_345_673) }.to raise_error(ArgumentError)
  end

  it 'can double the digit from scanning for even numbers ' do
    expect(described_class.new.sum_doubled_digit(1714)).to eq(15)
  end

  it 'can double the digit from scanning for odd numbers ' do
    expect(described_class.new.sum_doubled_digit(89_190)).to eq(27)
  end

  it 'can return true when 2121 valid number passed' do
    expect(described_class.new.validate(2121)).to eq(true)
  end

  it 'can return false when 1 invalid number passed' do
    expect(described_class.new.validate(1)).to eq(false)
  end

  it 'can return false when 12 invalid number passed' do
    expect(described_class.new.validate(12)).to eq(false)
  end
end
