module MarchMadness
  class Config
    def initialize(filename, node)
      @filename = filename
      @node = node
    end

    def data
      @data ||= YAML::load_file(@filename)[@node]
    end

    def method_missing(method, *args)
      data[method.to_s]
    end
  end
end