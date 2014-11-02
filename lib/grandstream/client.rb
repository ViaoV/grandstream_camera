require "open-uri"
require "net/http"
require "uri"

module Grandstream
    class Client
        attr_accessor :camera_ip

        def initialize(camera_ip)
            @camera_ip  = camera_ip
        end

        def snapshot_url
            "#{base_url}/snapshot/view0.jpg"
        end

        def base_url 
            "http://#{camera_ip}"
        end

        def get_snapshot(image_path)
            File.write(image_path, open(snapshot_url).read, {mode: 'wb'})
        end

        def get(path)
            url = "#{base_url}/#{path}?cmd=get"
            open(url).read
        end

        def set(path, params)
            url = "#{base_url}/#{path}?cmd=set&#{params.map{|k,v| "#{k}=#{v}"}.join("&")}"
            http_request(url) do |http, uri|
                req = Net::HTTP::Get.new(uri)
                req.basic_auth 'admin', 'admin'
                response = http.request(req)
            end
        end

        def load_options(path)
            options_hash = {}
            get(path).split("\n").each do |line|
                vals = line.split('=')
                options_hash[vals[0]] = vals[1].chomp if vals[1]
            end
            options_hash
        end

        def http_request(url) 
            uri = URI url
            Net::HTTP.start(uri.host, uri.port) do |http|
                yield(http, uri)
            end
        end

        def set_options(path, options)
            set(path, options)
        end

    end
end
