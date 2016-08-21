class Display
  def self.welcome_message
    'Welcome.\nTo list all songs type \'list songs\'
    To see a list of artists type \'list artists\'
    To see alist of genres type \'list genres\'
    To play a song type \'play song\'
    To see a list of songs from an artist type \'list artist\'
    To see a list of genres from an artist type \'list genre\'
    Type exit to exit the program.'
  end

  def self.prompt_user
    print '\nEnter a command>> '
  end

  def self.welcome_user
    puts welcome_message
    prompt_user
  end
end
