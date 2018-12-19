require 'rspec/autorun'

class Rectangle
  attr_accessor :height, :width

  def calculate_area
    width * height
  end
end

class Square < Rectangle
  def width=(width)
    super(width)
    @height = width
  end

  def height=(height)
    super(height)
    @width = height
  end
end

RSpec.describe Rectangle do
  subject { Rectangle.new }

  it 'calculates area' do
    subject.height = 10
    subject.width = 5
    expect(subject.calculate_area).to eq 50
  end
end

RSpec.describe Square do
  subject { Square.new }

  it 'calculates area' do
    subject.height = 5
    subject.width = 5
    expect(subject.calculate_area).to eq 25
  end

  it do
    subject.width = 5
    subject.height = 10
    expect(subject.calculate_area).to eq 25
  end
end

# RSpec.describe Triangle do
#   subject { Triangle.new }

#   it 'calculates area' do
#     subject.height = 5
#     subject.base = 10
#     expect(subject.calculate_area).to eq 25
#   end

#   it 'calculates area without height' do
#     subject.side1 = 6
#     subject.side2 = 10
#     subject.side3 = 8
#     expect(subject.calculate_area).to eq 24
#   end
# end
