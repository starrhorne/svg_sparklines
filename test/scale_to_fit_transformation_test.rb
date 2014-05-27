require 'test_helper'
 
describe SvgSparklines::ScaleYToFitTransformation do
 
  it "Scales y values to fit 0..100 percent" do
    data = SvgSparklines::DataSet.new(data: [[1,2],[0,0],[8,9],[9,10]])
    transform = SvgSparklines::ScaleYToFitTransformation.new(input: data, fit: 100)
    transform.output.data.must_equal([[1, 20], [0, 0], [8, 90], [9, 100]])
  end

  it "handles 0 data ok" do
    data = SvgSparklines::DataSet.new(data: [[1,0],[0,0],[8,0],[9,0]])
    transform = SvgSparklines::ScaleYToFitTransformation.new(input: data, fit: 100)
    transform.output.data.must_equal([[1,0],[0,0],[8,0],[9,0]])
  end

end
