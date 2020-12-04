require 'net/http'
require 'uri'
require 'json'

class Tradutor
    def initialize
        @uri = URI.parse("https://api.gotit.ai/Translation/v1.1/Translate")
        @request = Net::HTTP::Post.new(@uri, 'Content-Type' => 'application/json')
        @request.basic_auth("1985-qukfjnis", "MvNhV5X6kfaghjaxi9f1+7f7RBHTxmDMdUMQ56g2i2aZ")
    end

    def traduzir(msg, de, para)
        @request.body = {T: msg, SL: de, TL: para}.to_json
        response = Net::HTTP.start(@uri.hostname, @uri.port, use_ssl: @uri.scheme == "https") do |http|
            http.request(@request)
        end

        request_json = JSON.parse(@request.body)
        response_json = JSON.parse(response.body)
        log(request_json, response_json)
        
        return response_json["result"]
    end

    def log(request, response)
        time = Time.new
        msg = request["T"]
        de = request["SL"]
        para = request["TL"]
        traducao = response["result"]

        file = File.open(time.strftime("%m-%d-%Y.%H.%M.%S") + ".txt", 'w') do |fline|
            fline.puts ("De: #{de}")
            fline.puts ("Para: #{para}")
            fline.puts ("Mensagem: #{msg}")
            fline.puts ("Tradução: #{traducao}")
        end
    end
end
 