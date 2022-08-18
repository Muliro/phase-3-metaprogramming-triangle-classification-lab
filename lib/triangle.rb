





class Triangle
  attr_reader :side_1, :side_2, :side_3
  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end
  # write code here
  def kind
    validate_triangle
    if side_1 == side_2 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 || side_2 == side_3 || side_1 == side_3
      :isosceles
    else
      :scalene
    end
  end

  def sides_positive?
    [side_1, side_2, side_3].each do |side| 
      side > 0
    end
  end

  def valid_triangle?
    side_1 + side_2 > side_3 && side_1 + side_3 > side_2 && side_2 + side_3 > side_1
  end

  def validate_triangle
    raise TriangleError unless sides_positive? && valid_triangle?
  end

  class TriangleError < StandardError
  end
end
