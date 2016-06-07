require "eventDispatcherMercadoni/version"
require "net/http"
require "uri"

module EventDispatcherMercadoni

  def self.process(str)
    str
  end

  module ClassMethods

    def subscribe_event(id_subscriber, token, data)
      uri = URI.parse("https://ed.mercadoni.com/subscribers/"+ id_subscriber +"/events?token=" + token)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      request = Net::HTTP::Post.new(uri.request_uri)
      request.content_type = 'application/x-www-form-urlencoded'
      request.set_form_data(data)
      response = http.request(request)
      return response
    end

  end

end
