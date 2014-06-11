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
    chart.render.must_equal "<svg xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" width=\"40\" height=\"40\"> <g transform=\"translate(20,20)\"> <path d=\" M20.0,0.0 A20,20 0 1,1 -4.158233816355196,-19.56295201467611 L-2.079116908177598,-9.781476007338055 A-10,10 0 1,0 10.0,0.0 Z \" style=\" fill: #cccccc; \" transform=\"rotate(12)\"/> <path d=\" M20.0,0.0 A20,20 0 0,1 -4.158233816355183,19.562952014676114 L-2.0791169081775913,9.781476007338057 A-10,10 0 0,0 10.0,0.0 Z \" style=\" fill: #000000; \" transform=\"rotate(-90)\"/> </g> </svg>"
  end


end
