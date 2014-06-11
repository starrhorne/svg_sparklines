module SvgSparklines
  class LineChart < Chart
    
    attr_accessor :stroke, :stroke_width

    def after_initialize(args)
      @stroke = args.fetch(:stroke, "#000000")
      @stroke_width = args.fetch(:stroke_width, "1")
    end

    def render_data
      %[<polyline fill="none" stroke="#{ stroke }" stroke-width="#{ stroke_width }" points = "#{ points }" />]
    end

    def points
      data.map { |pair| pair.join(",") }.join(" ")
    end

  end
end
