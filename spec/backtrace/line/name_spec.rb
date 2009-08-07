describe "Backtrace::Line#name" do
  it "returns a Symbol" do
    l = Backtrace::Line.new("/usr/local/lib/ruby/irb.rb:271:in `signal_status'")
    l.name.should be_an_instance_of(Symbol)
  end

  it "returns the method name" do
    l = Backtrace::Line.new("/usr/local/lib/ruby/irb.rb:271:in `signal_status'")
    l.name.should == :signal_status
  end

  it "works with 'in block in'" do
    l = Backtrace::Line.new("ruby-lex.rb:230:in `block in each_top_level_statement'")
    l.name.should == :each_top_level_statement
  end

  it "works with 'in block (\d levels)'" do
    l = Backtrace::Line.new("foo.rb:15:in `block (2 levels) in eval_input'")
    l.name.should == :eval_input
  end

  it "works when called from eval's" do
    l = Backtrace::Line.new("(irb):1:in `eval'")
    l.name.should == :eval
  end

  it "returns nil when there's a label, such as '<main>', instead of a method name" do
    l = Backtrace::Line.new("/usr/local/bin/irb:12:in `<main>'")
    l.name.should be_nil
  end
end
