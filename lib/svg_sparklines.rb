require "svg_sparklines/version"
require "svg_sparklines/data_set"
require "svg_sparklines/transformation"
require "svg_sparklines/scale_to_fit_transformation"
require "svg_sparklines/origin_transformation"
require "svg_sparklines/chart"
require "svg_sparklines/line_chart"
require "svg_sparklines/doughnut_chart"
require "svg_sparklines/bar_chart"

module SvgSparklines

  def self.line(args)
    data = SvgSparklines::DataSet.new(data: args.fetch(:data))

    width = args.fetch(:width, data.width)
    height = args.fetch(:height, data.height)
    stroke_width = args.fetch(:stroke_width, 1)
    stroke = args.fetch(:stroke, "#000000")


    transform = SvgSparklines::ScaleYToFitTransformation.new(input: data, fit: height)
    transform = SvgSparklines::ScaleXToFitTransformation.new(input: transform.output, fit: width)
    transform = SvgSparklines::OriginTransformation.new(input: transform.output, height: height)

    LineChart.new(data: transform.output, width: width, height: height, stroke_width: stroke_width, stroke: stroke).render
  end

end
