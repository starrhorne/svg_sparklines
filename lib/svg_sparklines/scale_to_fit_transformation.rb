module SvgSparklines

  class  ScaleToFitTransformation < Transformation

    attr_accessor :fit

    def after_initialize(args)
      @fit = args.fetch(:fit, 100)
    end

    def scale(n, input_max)
      return 0 if input_max == 0
      (fit * (n.to_f / input_max)).round
    end

  end

  class  ScaleYToFitTransformation < ScaleToFitTransformation
    def normalize(x, y)
      [x, scale(y, input.max_y)]
    end
  end

  class  ScaleXToFitTransformation < ScaleToFitTransformation
    def normalize(x, y)
      [scale(x, input.max_x), y]
    end
  end

end
