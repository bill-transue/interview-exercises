require 'json'
require 'rspec/autorun'

class FakeHTTP
  def self.get(url)
    OpenStruct.new(body: FakeJson.random)
  end
end

class FakeJson
  MEI_QUOTES =
  [
    {"quote":"Hey, chill out!","character":"Mei","game":"Overwatch"},
    {"quote":"Ice wall, coming up.","character":"Mei","game":"Overwatch"},
    {"quote":"Freeze! Dont move!","character":"Mei","game":"Overwatch"},
    {"quote":"That could have gone better.","character":"Mei","game":"Overwatch"},
    {"quote":"Haha, watch this!","character":"Mei","game":"Overwatch"}
  ]

  def self.random
    return MEI_QUOTES.sample.to_json
  end
end

raw = FakeHTTP.get('some-url').body
quote = JSON.parse(raw)
puts "#{quote['character']}: #{quote['quote']}"