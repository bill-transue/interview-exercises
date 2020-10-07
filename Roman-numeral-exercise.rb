require 'rspec/autorun'

class Integer
  def to_roman_numeral
  end
end

RSpec.describe '#to_roman_numeral' do
  it 'returns i for 1' do
    expect(1.to_roman_numeral).to eql('i')
  end

  it 'returns v for 5' do
    expect(5.to_roman_numeral).to eql('v')
  end
end