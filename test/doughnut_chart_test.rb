require 'test_helper'
 
describe SvgSparklines::DoughnutChart do
 
  it "must be defined" do
    SvgSparklines::DoughnutChart.wont_be_nil
  end

  it "sets width and height based on radius" do
    chart = SvgSparklines::DoughnutChart.new(radius: 20, thickness: 5, degrees: 120 )
    chart.width.must_equal 40
    chart.height.must_equal 40
  end

  it "renders a chart" do
    chart = SvgSparklines::DoughnutChart.new(radius: 20, thickness: 10, degrees: 102 )
    File.open("/tmp/t.svg", "w") { |f| f.write(chart.render) }
    chart.render.must_equal ""
  end


end
