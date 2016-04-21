require 'sinatra'

#default displays the index page
get '/' do
    erb :index
end

# word is the word we want to find the anagram for
get '/anagrams/:word' do
    @word = params[:word]
    # call word.find_anagrams and pass in our word
    @anagrams = Word.find_anagrams(@word)
    erb :show
end

# Take the word from the params and redirect to new /anagrams/:word route
post '/' do
    @word = params[:word]
    redirect "/anagrams/#{@word}"
end