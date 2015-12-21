module Requests
  module JsonHelpers
    def body
      JSON.parse(response.body, symbolize_names: true)
    end

    delegate :status, to: :response
  end
end
