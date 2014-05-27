require 'test_helper'
 
describe "version" do
 
  it "must be defined" do
    SvgSparklines::VERSION.wont_be_nil
  end

  # it "renders a line chart" do
  #   SvgSparklines.line(data: [[1,1],[2,4], [3, 9]], height: 100, width: 100).must_equal("")
  # end

 
end
