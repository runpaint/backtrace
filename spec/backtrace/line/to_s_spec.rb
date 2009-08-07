describe "Backtrace::Line#to_s" do
  it "returns 'file:line: in `name'' when all 3 fields are defined" do
    l = Backtrace::Line.new("/usr/local/lib/ruby/1.9.1/irb.rb:69:in `start'")
    l.to_s.should == "/usr/local/lib/ruby/1.9.1/irb.rb:69:in `start'"
  end

  it "returns 'file:line: in `<label>'' when there's a label instead of a method name" do
    l = Backtrace::Line.new("/usr/local/bin/irb:12:in `<main>'")
    l.to_s.should == "/usr/local/bin/irb:12:in `<main>'"
  end

  it "returns '(context):line: in `name'' when there's a context instead of a filename" do
    l = Backtrace::Line.new("(irb):1:in `eval'")
    l.to_s.should == "(irb):1:in `eval'"
  end
end
