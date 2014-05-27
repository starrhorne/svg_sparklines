
module SvgSparklines
  class Chart

    attr_accessor :data, :width, :height

    def initialize(args)
      @data = args.fetch(:data)
      @width = args.fetch(:width, data.width)
      @height = args.fetch(:height, data.height)
      after_initialize(args)
    end

    def after_initialize(args)
    end

    def render
      ["<svg #{ svg_options }>", render_data, "</svg>"].flatten.join
    end

    def render_data
      ""
    end

    protected

      def svg_options
        [
          ["xmlns", "http://www.w3.org/2000/svg"],
          ["xmlns:xlink", "http://www.w3.org/1999/xlink"],
          ["width", width],
          ["height", height],
        ].reject { |k, v| !v }.map { |k, v| %[#{ k }="#{v}"] }.join(" ")
      end

  end


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
