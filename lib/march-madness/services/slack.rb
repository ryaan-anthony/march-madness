module MarchMadness
  class Slack
    def initialize
      @config = Config.new('config.yml', 'slack')
    end

    def puts(message)
      client.post(
        headers: {'Content-type': 'application/json'},
        path: @config.webhook_path,
        body: { text: message }.to_json
      )
    end

    private

    def client
      @client ||= Client.new(@config)
    end
  end
end