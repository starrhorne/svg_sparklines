require 'test_helper'
 
describe SvgSparklines::DataSet do
 
  describe "#max_x" do
    it "returns the maximum x value" do
      data = SvgSparklines::DataSet.new(data: [[1,2],[0,0],[8,9]])
      data.max_x.must_equal(8)
    end
  end

  describe "#max_y" do
    it "returns the maximum y value" do
      data = SvgSparklines::DataSet.new(data: [[1,2],[0,0],[8,9]])
      data.max_y.must_equal(9)
    end
  end

end
