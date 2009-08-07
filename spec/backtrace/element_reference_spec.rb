describe "Backtrace#[]" do
  include BacktraceSpecs

  before(:each) do
    @bt, @cl = backtrace_caller
  end

  it "accepts an Integer argument" do
    lambda { @bt[2] }.should_not raise_error(ArgumentError)   
  end

  it "returns a Line object" do
    @bt[1].should be_an_instance_of(Backtrace::Line)
  end

  it "indexes the backtrace from 0" do
    @cl[0].match(/^(?<file>[^:]+):/)[:file]
    File.basename(@bt[0].file).should == File.basename($~[:file])
  end

  it "returns nil for invalid indices" do
    @bt[200].should be_nil
  end
end
