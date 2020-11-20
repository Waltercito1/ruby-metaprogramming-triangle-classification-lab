class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end
  
  def kind
    validate_triangle 
    if @a == @b && @b == @c
      :equilateral
    elsif @a == @b || @b == @c || @c == @a
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end  

  def validate_triangle
    true_triangle = [(b + c > a), (a + b > c), (a + c > b)]
    [a,b,c].each do |side|
      true_triangle << false if side <= 0
    raise TriangleError if true_triangle.include?(false)
    end
  end
end
