# frozen_string_literal: true

require_relative 'test_task'

RSpec.describe TestTask do
  describe '.call' do
    it 'outputs the count of truchy values' do
      expect { described_class.call }.to output("5\n").to_stdout
    end
  end

  describe '#read_file' do
    it 'reads the file and populates values' do
      subject.read_file
      expect(subject.values).to match_array([
                                              { letter: 'a', range: 1..5, password: 'abcdj' },
                                              { letter: 'z', range: 2..4, password: 'asfalseiruqwo' },
                                              { letter: 'b', range: 3..6, password: 'bhhkkbbjjjb' },
                                              { letter: 'a', range: 1..5, password: 'abcdsdgdgj' },
                                              { letter: 'z', range: 2..4, password: 'falsdfgs' },
                                              { letter: 'b', range: 3..6, password: 'hkkbbjsdg' },
                                              { letter: 'm', range: 2..5, password: 'nzxsdgsgt' },
                                              { letter: 'g', range: 4..7, password: 'ijklwegw' },
                                              { letter: 'd', range: 1..6, password: 'dxwrfgsdg' },
                                              { letter: 'y', range: 2..6, password: 'sfalesdg' },
                                              { letter: 'c', range: 3..7, password: 'cjjjjjbf' },
                                              { letter: 'q', range: 1..4, password: 'qwesdg' },
                                              { letter: 'r', range: 2..5, password: 'ytuisgwer' }
                                            ])
    end
  end

  describe '#count_truthy' do
    before do
      subject.values = [
        { letter: 'a', range: 1..5, password: 'abcdj' },
        { letter: 'z', range: 2..4, password: 'asfalseiruqwo' },
        { letter: 'b', range: 3..6, password: 'bhhkkbbjjjb' }
      ]
    end

    it 'counts the truthy values' do
      expect { subject.count_truthy }.to output("2\n").to_stdout
    end
  end

  describe '#to_range' do
    it 'converts the string to a range' do
      expect(subject.send(:to_range, '2-5')).to eq(2..5)
    end
  end
end
