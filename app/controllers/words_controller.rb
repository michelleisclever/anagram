require 'sinatra'

get '/words' do
    @word = Word.all
    erb :"/words/index"
end

get '/words/:id' do
    @word = Word.find(params[:id])    
    erb :"/words/show"
end