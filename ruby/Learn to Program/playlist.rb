# Set an array for the source diretories
artists = ['LCD Soundsystem', 'Lady Gaga', 'Miike Snow', 'Ratatat', 'Girls', 'Gorillaz', 'Four Tet']

def make_playlist source_folders
  # Go to the main music directory
  all_music = '/Users/tannerwelsh/Music/iTunes/iTunes Media/Music/'
  Dir.chdir all_music
  
  # Create an array for the playlist songs
  playlist = []
  
  # Cycle through each of the source folders
  source_folders.each do |artist|
    # Make sure the file exists
    if File.directory?(artist + '/')
      all_songs = Dir[artist + '/**/*.{mp3,m4a,MP3,M4A}']
      
      if all_songs.length >= 3
        3.times do
          rand_no = rand(all_songs.length)
          song = all_songs[rand_no]
          unless playlist.include?(song)
            playlist.push song
          end
        end
      end
    end
  end
  
  # Randomize the playlist
  playlist = playlist.sort_by{rand}
  # Add the full filename to each element
  full_playlist = []
  playlist.each do |song|
    song = all_music + song
    full_playlist.push song
  end
  # Create a string, with each song on a new line
  playlist_string = full_playlist.join("\n")
  
  # Name the new file to store the playlist in
  destination_dir = '/Users/tannerwelsh/Desktop/'
  playlist_name = destination_dir + 'Some good random songs.m3u'
  
  File.open playlist_name, 'w' do |f|
    f.write playlist_string
  end
  
  if (File.read playlist_name) == (playlist_string)
    puts 'Success!'
  else
    puts 'Something went wrong...'
  end
end

make_playlist artists