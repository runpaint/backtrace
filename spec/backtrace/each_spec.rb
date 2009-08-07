describe "Backtrace#each" do
  include BacktraceSpecs

  it "yields a Line object" do
    bt, cl = backtrace_caller
    bt.each do |line|
      line.should be_an_instance_of(Backtrace::Line)
    end
  end

  it "yields each Line object in turn" do
    bt, cl = backtrace_caller
    bt.each_with_index do |line, idx|
      caller_line = cl[idx].match(/^[^:]+?:(?<line>\d+)/)[:line]
      p "line = #{line}"
      p "caller_line = #{caller_line}"
      line.line.should == caller_line.to_i
    end
  end
end
