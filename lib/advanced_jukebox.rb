#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

 my_songs = {
 "Go Go GO" => '/home/artificial-minifier-1041/jukebox-cli-dumbo-web-102918/audio/Emerald-Park/01.mp3',
 "LiberTeens" => '/home/artificial-minifier-1041/jukebox-cli-dumbo-web-102918/audio/Emerald-Park/02.mp3',
 "Hamburg" =>  '/home/artificial-minifier-1041/jukebox-cli-dumbo-web-102918/audio/Emerald-Park/03.mp3',
 "Guiding Light" => '/home/artificial-minifier-1041/jukebox-cli-dumbo-web-102918/audio/Emerald-Park/04.mp3',
 "Wolf" => '/home/artificial-minifier-1041/jukebox-cli-dumbo-web-102918/audio/Emerald-Park/05.mp3',
 "Blue" => '/home/artificial-minifier-1041/jukebox-cli-dumbo-web-102918/audio/Emerald-Park/06.mp3',
 "Graduation Failed" => '/home/artificial-minifier-1041/jukebox-cli-dumbo-web-102918/audio/Emerald-Park/07.mp3'
 }

def help
  #this method should be the same as in jukebox.rb
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and 
  #list the songs by name
  i = 1
  my_songs.each do |title, absolute_path|
    puts "#{i}. #{title}"
    i += 1
  end
end

def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  
  puts "Please enter a song name:"
  user_response = gets.chomp
  if my_songs.has_key?(user_response)
    system "open my_songs[user_response]"
  else
    puts "Your choice is invalid."
  end
end

def exit_jukebox
  #this method is the same as in jukebox.rb
  puts "Goodbye"
end

def run(my_songs)
  #this method is the same as in jukebox.rb
  help
  user_input = ""
  until user_input == "exit"
    puts "Please enter a command:"
    user_input = gets.downcase.chomp
    case user_input
      when "list"
        list(my_songs)
      when "play"
        play(my_songs)
      else "help"
        help
    end
  end
  exit_jukebox
end
