require 'test_helper'
 
describe SvgSparklines::LineChart do
 
  it "must be defined" do
    SvgSparklines::LineChart.wont_be_nil
  end

  it "renders an svg object" do
    chart = SvgSparklines::LineChart.new(data: SvgSparklines::DataSet.new(data: [[1, 1], [2, 2], [3, 6]]), stroke: "red", stroke_width: "2")
    chart.render_data.must_equal "<polyline fill=\"none\" stroke=\"red\" stroke-width=\"2\" points = \"1,1 2,2 3,6\" />"
  end
  
end
