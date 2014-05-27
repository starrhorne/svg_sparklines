module SvgSparklines

  class OriginTransformation < Transformation

    attr_accessor :height

    def after_initialize(args)
      @height = args.fetch(:height)
    end

    protected

      def normalize(x, y)
        [x, height - y]
      end

  end


end
