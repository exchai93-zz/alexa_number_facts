require 'sinatra'
require 'json'

post '/' do

  number_facts_uri = URI("http://numbersapi.com/42")

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
