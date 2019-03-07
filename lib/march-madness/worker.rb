module MarchMadness
  class Worker
    def initialize(output = $stdout)
      @output = output
    end

    def puts(message)
      @output.puts(message)
    end
  end
end