describe "Backtrace#line" do

  include BacktraceSpecs

  before(:each) do
    @bt, @cl = backtrace_caller
  end

  it "returns an Integer" do
    @bt.line.should be_a_kind_of(Integer)
  end

  it "returns the line number for the 0th Line by default" do
    @cl[0].match(/:(?<number>\d+):/)
    @bt.line.should == $~[:number].to_i
  end

  it "accepts an Integer argument" do
    lambda { @bt.line(2) }.should_not raise_error(ArgumentError)
  end

  it "returns the line number of the Line at the given position in the backtrace" do
    @cl[2].match(/:(?<number>\d+):/)
    @bt.line(2).should == $~[:number].to_i
  end
end
