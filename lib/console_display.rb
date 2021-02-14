require 'colorize'

class ConsoleDisplay

  def prompt(msg = 'Enter a command >> ')
    render msg.colorize(:light_blue)
    receive_command
  end

  def render(str)
    print str
  end

  def render_line(str)
    puts str, "\n"
  end

  def render_error(str)
    render_line str.colorize(:red)
  end

  def receive_command
    STDIN.gets.strip.chomp
  end
end
