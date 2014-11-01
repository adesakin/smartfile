require "net/https"
require "uri"
require "yaml"


class SmartFile

  attr_accessor :key, :pass
  attr_accessor :base_url, :service_path
  attr_accessor :response, :json_response

  def initialize()
    @key = SMARTFILE_CONFIG['key']
    @pass = SMARTFILE_CONFIG['pass']
    @base_url = "https://app.smartfile.com/api/2"
    @service_path = ""
  end

  def full_url
    @base_url + @service_path
  end

  # valid formats - [json] [json-p] [json-t] [html] [xhtml] [txt] [xml]
  def setup(endpoint, format = "json")
    case endpoint
    when :path_info
      @service_path = "/ping/?format=#{format}"
    when :path_data
      @service_path = "/whoami/?format=#{format}"
    when :session
      @service_path = "/session/?format=#{format}"
    when :ping
      @service_path = "/ping/?format=#{format}"
    when :whoami
      @service_path = "/whoami/?format=#{format}"
    when :session
      @service_path = "/session/?format=#{format}" 
    else
      @service_path = "#{endpoint.to_s}?format=#{format}"
    end
  end

  def get(params = {}, full_response = false)
    method_request("get", params = {}, full_response = false)
  end

  def post(params = {}, full_response = false)
    method_request("post", params = {}, full_response = false)
  end

  def put(params = {}, full_response = false)
    method_request("put", params = {}, full_response = false)
  end


  def method_request(method, params = {}, full_response = false)
    uri = URI.parse(full_url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    # VERIFY_NONE is not ideal for security, but its a risk I'm willing to take.
    # For the paranoid if you want to add cert bundles to your server you can fix it:
    # http://www.rubyinside.com/how-to-cure-nethttps-risky-default-https-behavior-4010.html
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    case method
    when "get"
      @request = Net::HTTP::Get.new(uri.request_uri)
    when "post"
      @request = Net::HTTP::Post.new(uri.request_uri)
    when "put"
      @request = Net::HTTP::Put.new(uri.request_uri)
    end
    @request.basic_auth(@key, @pass)
    @request.set_form_data(params)
    @response = http.request(@request)
    
    if full_response
      return @response
    else
      return @response.body
    end
  end
end