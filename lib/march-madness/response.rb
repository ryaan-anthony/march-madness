module MarchMadness
  class Response
    def initialize(response)
      @response = response
    end

    def body
      JSON.parse(@response.body)
    end
  end
end