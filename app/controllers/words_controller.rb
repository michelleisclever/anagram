require 'sinatra'

get '/words' do
    @word = Word.all
    erb :"/words/index"
end

get '/words/new' do
    @word = Word.new
    erb :"/words/new"
end    
    
    post '/words' do
        @word = Word.create(text: params[:text])
        if @word.valid?
            @word.save
            redirect "/words/#{@word.id}"
            else
            @errors = "Please add a word not already in the dictionary."
        end
    erb :"/words/new"
end

get '/words/:id/edit' do
    @word = Word.find(params[:id])
    erb :"/words/edit"
end

put '/words/:id' do
    @word = Word.find(params[:id])
    @word.text = params[:text]
    if @word.valid?
        @word.save
        redirect "/words/#{@word.id}"
    else
        @errors = "Please be sure to add all input."
    end
    erb :"/words/edit"
end

get '/words/:id' do
    @word = Word.find(params[:id])    
    erb :"/words/show"
end