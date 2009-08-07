require_relative 'spec_helper'

describe "Kernel#backtrace" do
  it "is a method" do
    Kernel.respond_to?(:backtrace).should be_true
  end

  it "returns a Backtrace object" do
    backtrace.should be_an_instance_of(Backtrace)
  end
end
