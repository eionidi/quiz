require_relative 'lib/quiz'
require_relative 'lib/data_reader'

file_name = "#{__dir__}/data/ask_me.xml"

begin
  data_reader = DataReader.new(file_name)
rescue DataReader::FileNotFoundError => error
  abort "#{error.message}"
end

quiz = Quiz.new(data_reader.questions, data_reader.answers)

puts "Ответьте на вопросы"

until quiz.finished?
  puts quiz.ask_questions
  input = ""
  input = STDIN.gets.chomp.downcase while input.empty?
  quiz.check_input(input)
end

puts "У вас #{quiz.score} правильных ответов из #{quiz.questions.size}"