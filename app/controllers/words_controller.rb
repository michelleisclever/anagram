require 'sinatra'

get '/words' do
    @word = Word.all
    erb :"/words/index"
end