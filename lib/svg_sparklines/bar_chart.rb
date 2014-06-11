module SvgSparklines
  class BarChart < Chart
    
    attr_accessor :fill, :bar_width, :bar_margin

    def after_initialize(args)
      @fill = args.fetch(:fill, "#000000")
      @bar_width = args.fetch(:bar_width, 5)
      @bar_margin = args.fetch(:bar_margin, 2)
    end

    def render_data
      data.map { |x, y| rect(x,y) }.join
    end

    def rect(x, y)
      %[<rect x="#{ x * (bar_width + bar_margin) }" y="#{ height-y }" width="#{ bar_width }" height="#{ y }" fill="#{ fill }"></rect>]
    end

  end
end
