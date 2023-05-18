# frozen_string_literal: true

def process_each_option(option, values)
  # Continue accepting input until the user
  # inputs a fully empty line.
  # Finally remove the last unnecessary
  # new line from the input.
  user_input = $stdin.gets("\n\n").chomp

  # Process the options
  case option
  when 'chars' # read the count of characters
    user_input.each_char do |c|
      # the count of currently inputted characters will be
      # marked into a hash until a new line comes
      values['chars'] += 1 unless c.include?("\n")
    end
  when 'words' # read the count of words
    user_input.each_char do |c|
      # the count of currently inputted words will be
      # marked into a hash if a new line or a space comes
      values['words'] += 1 if c.include?(' ') || c.include?("\n")
    end
  when 'lines' # read the count of lines
    user_input.each_char do |c|
      # the count of currently inputted lines will be
      # marked into a hash if a new line comes
      values['lines'] += 1 if c.include?("\n")
    end
  end
end

def usage
  puts 'Usage: wc [-c|-w|-l]'
  exit 1
end

def main
  if ARGV.empty?
    usage
  # if the user has given too many arguments
  elsif ARGV.length >= 2
    usage
  end

  processed_values = { 'chars' => 0, 'words' => 0, 'lines' => 0 }

  case ARGV[0]
  when '-c'
    process_each_option('chars', processed_values)
    puts processed_values['chars']
  when '-w'
    process_each_option('words', processed_values)
    puts processed_values['words']
  when '-l'
    process_each_option('lines', processed_values)
    puts processed_values['lines']
  else # if the argument isn't valid
    usage
  end
end

main
