require 'open-uri'

class GamesController < ApplicationController

  def new
    alphabet = ('A'..'Z').to_a
    @letters = []
    10.times do
      @letters << alphabet.sample
    end
  end

  def score
    @word = params[:word].upcase
    @letters = params[:letters].split('')
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    word_serialized = URI.open(url).read
    result = JSON.parse(word_serialized)
    found = result["found"]
      if found
        @message = "Congratulations! #{@word} is a valid English word!"
      else
        @message = "#{@word} does not seem to be a valid English word.."
      end
  end

end
