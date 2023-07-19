# frozen_string_literal: true

class TestTask
  attr_accessor :values, :hh

  def initialize
    @values = []
    @hh = {}
  end

  def self.call
    task = new
    task.read_file
    task.count_truthy
  end

  def read_file
    File.foreach('file.txt') do |line|
      letter, range, password = line.split(' ')
      values << {
        letter: letter,
        range: to_range(range),
        password: password.strip
      }
    end
  end

  def count_truthy
 		count = values.count { |value| value[:password][value[:range]].include?(value[:letter]) }
    puts count
  end

  private

  def to_range(str)
    # for example, 2-5, taking first and third element
    # also deduct 1 from every element for proper indexes
    str[0].to_i-1..str[2].to_i-1
  end
end

TestTask.call
