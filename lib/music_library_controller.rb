class MusicLibraryController
  include Concerns::Display
  COMMANDS = [
    'list songs',
    'list artists',
    'list genres',
    'play song',
    'list artist',
    'list genre'
  ].freeze

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call
    welcome_user
    run_repl_loop
  end

  private

  def run_repl_loop
    loop do
      user_choice = gets.chomp.downcase
      break if user_choice == 'exit'
      if user_choice_is_valid?(user_choice)
        execute_user_choice(user_choice)
      else
        puts "\nWrong command. Try again.\n".colorize(:red)
      end
      prompt_user
    end
  end

  def execute_user_choice(option)
    method_name = option.sub(' ', '_')
    send(method_name)
  end

  def user_choice_is_valid?(user_choice)
    COMMANDS.include?(user_choice)
  end
end
