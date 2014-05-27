module SvgSparklines

  class Transformation
    attr_accessor :input

    def initialize(args)
      @input = args.fetch(:input)
      after_initialize(args)
    end

    def after_initialize(args)
    end

    def output
      @output ||= DataSet.new(data:input.map { |x, y| normalize(x, y) })
    end

    def normalize(x, y)
      [x, y]
    end
  end

end
