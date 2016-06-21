require 'net/http'

class Account < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true, length: {minimum: 8}
  validates :name,format: {with: /\A(?=.*[a-z])[a-z\d]+\Z/i}
  validates :age, presence: true, numericality: {greater_than_or_equal_to: 18, less_than_or_equal_to: 100}

  def get_weather
    url = URI.parse('http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22Lviv%2C%20Ukraine%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    JSON.parse(res.body)['query']['results']['channel']['item']['condition']['text']
  end
end
