require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.dirname(__FILE__) + '/../lib/backtrace'
Spec::Runner.configure do |config|
end

module BacktraceSpecs
  def backtrace_caller
    [backtrace, caller.dup]
  end
end
