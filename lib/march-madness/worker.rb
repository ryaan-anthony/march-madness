module MarchMadness
  class Worker
    delegate :puts, to: :@output

    def initialize(output = $stdout)
      @output = output
    end
  end
end