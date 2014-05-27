module SvgSparklines
  class DataSet
    include Enumerable
    attr_accessor :data

    def initialize(args)
      @data = args.fetch(:data)
    end

    def each(*args, &block)
      data.each(*args, &block)
    end
    
    def max_x
      @max_x = max_by { |x, y| x }[0]
    rescue NoMethodError
      0
    end

    def max_y
      @max_y ||= max_by { |x, y| y }[1]
    rescue NoMethodError
      0
    end

    def min_x
      @min_x = min_by { |x, y| x }[0]
    rescue NoMethodError
      0
    end

    def min_y
      @min_y ||= min_by { |x, y| y }[1]
    rescue NoMethodError
      0
    end

    def width
      max_x - min_x
    end

    def height
      max_y - min_y
    end

  end
end
