require 'sinatra'

#default displays the index page
get '/' do
    erb :index
end

# word is the word we want to find the anagram for
get '/anagrams/:word' do
    @word = params[:word]
    # create alpha array of @word
    alphabetized_string = @word.chars.sort.join
    @anagrams = Word.where("letters=?", alphabetized_string)
    erb :show
end

# Take the word from the params and redirect to new /anagrams/:word route
post '/' do
    @word = params[:word]
    begin 
        Word.valid_input?(@word) 
      redirect "/anagrams/#{@word}"
    rescue Exception => error
      @error = error.message
      erb :index
    end
end