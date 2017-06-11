require 'nokogiri'

class DataReader
  attr_reader :questions, :answers
  class FileNotFoundError < ArgumentError; end

  def initialize(file_name)
    raise FileNotFoundError.new("Sorry, #{file_name} has not be found.") unless File.exist?(file_name)

    doc = File.open(file_name) { |f| Nokogiri::XML(f) }

    @questions =[]
    @answers =[]
    doc.xpath('//question').each { |element| @questions << element.text}
    doc.xpath('//answer').each { |element| @answers << element.text }
  end
end