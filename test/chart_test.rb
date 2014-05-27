require 'test_helper'
 
describe SvgSparklines::Chart do
 
  it "must be defined" do
    SvgSparklines::Chart.wont_be_nil
  end

  it "renders an empty svg object" do
    chart = SvgSparklines::Chart.new(data: SvgSparklines::DataSet.new(data:[]))
    chart.render.must_match /<svg[^>]*>[^<]*<\/svg>/i
  end

  it "renders width and height params" do
    chart = SvgSparklines::Chart.new(data: SvgSparklines::DataSet.new(data:[]), width: 123, height: 456)
    chart.render.must_match /width="123"/i
    chart.render.must_match /height="456"/i
  end

end
