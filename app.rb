require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = params[:user_text]
    @analyzed_text = TextAnalyzer.new(text_from_user)
    @number_words = @analyzed_text.number_words
    @vowels = @analyzed_text.vowels
    @consonants = @analyzed_text.consonants
    erb :results
  end
end
