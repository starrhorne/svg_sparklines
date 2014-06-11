require 'test_helper'
 
describe SvgSparklines::BarChart do
 
  it "must be defined" do
    SvgSparklines::BarChart.wont_be_nil
  end

  it "renders an svg object" do
    set = SvgSparklines::DataSet.new(data: [[0, 1], [1, 2], [2, 6]])
    transform = SvgSparklines::ScaleYToFitTransformation.new(input: set, fit: 30)
    chart = SvgSparklines::BarChart.new(data: transform.output, height: 30, width: 30 )
    chart.render_data.must_equal "<rect x=\"0\" y=\"25\" width=\"5\" height=\"5\" fill=\"#000000\"></rect><rect x=\"7\" y=\"20\" width=\"5\" height=\"10\" fill=\"#000000\"></rect><rect x=\"14\" y=\"0\" width=\"5\" height=\"30\" fill=\"#000000\"></rect>"
  end
  
end
