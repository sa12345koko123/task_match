class Public::NewsController < ApplicationController
  def index
  end


  def data
    # APIキーをpushしないように
    #binding.pry
    uri = URI.parse('https://newsapi.org/v2/top-headlines?country=jp&category=business&apiKey=' + ENV["NEWS_API_KEY"])
    json = Net::HTTP.get(uri)
    moments = JSON.parse(json)
    @data = moments['articles'].to_json
  end

end
