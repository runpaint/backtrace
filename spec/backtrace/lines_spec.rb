describe "Backtrace#lines" do
  
  include BacktraceSpecs

  before(:each) do
    @bt, @cl = backtrace_caller
  end
  
  it "returns an Array" do
    @bt.lines.should be_an_instance_of(Array)
  end

  it "sets each element of the Array to a Line object" do
    @bt.lines.each do |line|
      line.should be_an_instance_of(Backtrace::Line)
    end
  end

  it "returns the lines in the order that they occured, most recent first" do
    bt_basename = File.basename(@bt.lines.first.file)
    cl_basename = File.basename(@cl[0].match(/^(?<file>[^:]+):/)[:file])
    cl_basename.should == bt_basename
  end
end
