require_relative 'spec_helper'

describe "Object#backtrace" do
  it "returns a Backtrace object" do
    backtrace.should be_an_instance_of(Backtrace)
  end
end
