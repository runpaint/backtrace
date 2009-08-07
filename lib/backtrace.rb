module Kernel
  def backtrace
    Backtrace.new
  end
end

class Backtrace
  class Line
    attr_reader :file, :line, :name
    def initialize(line)
      /^((?<file>[^\(][^:]+)|(\((?<ctx>[^\)]+)\))): # filename or 'context'
        (?<number>\d+): #line number
        # method name or 'label' such as '<top (required)>
        in\s`(?:block\s(\(\d+\slevels\)\s)?in\s)?((?<name>[^<][^ ]+)|(?<label><([^>]+)>))'$
      /x =~ line
      @file = File.expand_path(file) if file
      @line = number.to_i
      @name = name.to_sym if name
      @ctx, @label = ctx, label
    end

    def to_s
     "#{file || '(' + @ctx + ')'}:#{line}:in `#{name || @label}'"
    end
   alias :inspect :to_s 
  end

  attr_reader :lines
  
  include Enumerable

  def initialize
    @lines = caller.map   { |l| Line.new(l) }
                   .reject{ |l| l.file == File.expand_path(__FILE__) }[1..-1]
  end

  def name(idx=0)
    lines[idx].name
  end

  def file(idx=0)
    lines[idx].file
  end

  def line(idx=0)
    lines[idx].line
  end

  def [](idx)
    lines[idx]
  end
  
  def each
    lines.each { |line| yield line }
  end
end
