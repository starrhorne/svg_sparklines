module SvgSparklines

  class PolarCoordinate
    attr_accessor :radius, :degrees

    def initialize(args)
      @radius = args.fetch(:radius)
      @degrees = args.fetch(:degrees)
    end

    def to_xy
      [radius * Math.cos(radians), radius * Math.sin(radians)] 
    end

    def to_s
      to_xy.join(",")
    end

    protected

      def radians
        Math::PI * degrees.to_f / 180.0
      end

  end


  class DougnutSegment

    attr_accessor :radius, :degrees, :thickness

    def initialize(args)
      @degrees = args.fetch(:degrees)
      @radius = args.fetch(:radius, 20)
      @thickness = args.fetch(:thickness, 5)
    end

    def to_s
      %[
        M#{ coordinates[0] }
        A#{ outer_arc_radius } 0 #{ sweep },1 #{ coordinates[1] }
        L#{ coordinates[2] }
        A-#{ inner_arc_radius } 0 #{ sweep },0 #{ coordinates[3] }
        Z
      ]
    end

    protected

      def sweep
        degrees >= 180 ? 1 : 0
      end

      def outer_arc_radius
        [radius,radius].join(",")
      end

      def inner_arc_radius
        [inner_radius,inner_radius].join(",")
      end

      def inner_radius
        radius - thickness
      end

      def coordinates
        @coordinates ||= path.map { |args| PolarCoordinate.new(args) }
      end

      def path
        [
          {radius: radius,        degrees: 0},
          {radius: radius,        degrees: degrees},
          {radius: inner_radius,  degrees: degrees},
          {radius: inner_radius,  degrees: 0}
        ]
      end


  end

  class DoughnutChart < Chart
    
    attr_accessor :radius, :degrees, :thickness, :fill, :background

    def after_initialize(args)
      @degrees = args.fetch(:degrees)
      @radius = args.fetch(:radius, 20)
      @thickness = args.fetch(:thickness, 5)
      @fill = args.fetch(:fill, "#000000")
      @background = args.fetch(:background, "#cccccc")
      @width = @height = 2 * radius
    end

    def render_data
      %[ 
        <g transform="translate(#{ origin })">
          <path d="#{ d(360-degrees) }" style="#{ background_style }" transform="rotate(#{ degrees - 90})"/> 
          <path d="#{ d(degrees) }" style="#{ style }" transform="rotate(-90)"/> 
        </g>
      ]
    end

    protected

      def origin
        [radius,radius].join(",")
      end

      def style
        %[ fill: #{ fill }; ]
      end

      def background_style
        %[ fill: #{ background }; ]
      end

      def d(degrees)
        DougnutSegment.new(radius: radius, degrees: degrees, thickness: thickness)
      end

  end
end

