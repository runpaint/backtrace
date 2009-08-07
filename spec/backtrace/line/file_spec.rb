describe "Backtrace::Line#file" do
  it "returns the filename" do
    l = Backtrace::Line.new("/usr/local/lib/ruby/irb.rb:271:in `signal_status'")
    l.file.should == "/usr/local/lib/ruby/irb.rb"
  end

  it "returns an absolute path" do
    l = Backtrace::Line.new("/usr/../usr/local/lib/ruby/irb.rb:27:in `signal_status'")
    l.file.should == "/usr/local/lib/ruby/irb.rb"
  end

  it "returns nil for eval's" do
    l = Backtrace::Line.new("(irb):1:in `eval'")
    l.file.should be_nil
  end
end
