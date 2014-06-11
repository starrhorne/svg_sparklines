module SvgSparklines
  class Chart

    attr_accessor :data, :width, :height

    def initialize(args)
      @data = args.fetch(:data, [])
      @width = args.fetch(:width, 100)
      @height = args.fetch(:height, 100)
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
end
