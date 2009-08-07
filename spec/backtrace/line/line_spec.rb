describe "Backtrace::Line#line" do
  it "returns an Integer" do
    l = Backtrace::Line.new("/usr/local/lib/ruby/irb/workspace.rb:80:in `eval'")
    l.line.should be_a_kind_of(Integer)
  end

  it "returns the line number" do
    l = Backtrace::Line.new("/usr/local/lib/ruby/irb/workspace.rb:80:in `eval'")
    l.line.should == 80
  end
end
