describe "Backtrace#file" do
  include BacktraceSpecs
  
  before(:each) do
    @bt, @cl = backtrace_caller
  end

  it "returns a existing filename" do
    File.exists?(backtrace.file).should be_true
  end
    
  it "returns the filename for the first line (0) by default" do
    @cl.size.should > 2
    @bt.lines.size.should > 2
    @cl[0].should =~ /#{File.basename __FILE__}/
    @bt.file.should == File.expand_path(__FILE__)
  end

  it "accepts an Integer argument" do
    lambda { backtrace.file(2) }.should_not raise_error(ArgumentError)
  end

  it "returns the filename for the given index" do
    @bt.file(1).should =~ /#{File.basename(@cl[1][/^([^:]+)/])}/
  end

  it "returns absolute filenames" do
    @bt.file.should == File.absolute_path(__FILE__)
  end
end
