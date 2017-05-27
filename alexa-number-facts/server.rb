require 'sinatra'
require 'json'
require 'net/http'

post '/' do

  # grab the slot value from the incoming request
  number = JSON.parse(request.body.read)["request"]["intent"]["slots"]["Number"]["value"]

  # pass that number to the numbers api
  number_facts_uri = URI("http://numbersapi.com/#{ number }")
  number_fact = Net::HTTP.get(number_facts_uri)

  {
    version: "1.0",
    respons:{
      outputSpeech: {
        type: "PlainText",
        text: number_fact
      }
    }
  }.to_json
end
