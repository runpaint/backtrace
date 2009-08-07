describe "Backtrace#name" do

  include BacktraceSpecs

  before(:each) do
    @bt, @cl = backtrace_caller
  end

  it "returns a Symbol" do
    backtrace.name.should be_an_instance_of(Symbol)
  end

  it "returns the method name for line 0 by default" do
    caller_name = caller[0].match(/`(?<name>[^ ]+)'$/)[:name].to_sym
    backtrace.name.should == caller_name
  end

  it "returns nil if the corresponding line doesn't include a method name" do
    @cl[0].should_not match(/`([^ ]+)'$/)
    @bt.name.should be_nil
  end

  it "accepts an Integer argument" do
    lambda { @bt.name(2) }.should_not raise_error(ArgumentError)
  end

  it "returns the method name corresponding to the given index" do
    @bt.name(3).to_s.should == @cl[3].match(/`(?<name>[^ ]+)'$/)[:name]
  end
end
