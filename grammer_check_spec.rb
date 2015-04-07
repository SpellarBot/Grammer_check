require 'rspec'
load 'grammer_check.rb'

describe 'Grammmer Check' do

  context 'test with valid sentence and should return nil instead of error message' do
    let(:test_sentence) { 'Welcome to RoR demo grammer checK.' }
    let(:class_instance) { GrammerCheck.new }

    it 'should start with a Uppercase character' do
      expect(class_instance.check_first_character(test_sentence)).to be nil
    end
    it 'allow lowercase character follows uppercase' do
      expect(class_instance.check_double_upcase(test_sentence)).to be nil
    end
    it 'should be one space between the words' do
      expect(class_instance.check_double_space(test_sentence)).to be nil
    end
    it 'sentence must end with a full stop(.)' do
      expect(class_instance.check_full_stop(test_sentence)).to be nil
    end
    it 'Two continuous spaces are not allowed' do
      expect(class_instance.check_double_space(test_sentence)).to be nil
    end
    it 'Two continuous upper case characters are not allowed' do
      expect(class_instance.check_double_upcase(test_sentence)).to be nil
    end
    it 'should return false when allowing Uppercase as last character' do
      expect(class_instance.check_last_character(test_sentence)).to be false
    end
  end

  context 'return error message when sentence is wrong' do
    let(:test_sentence) { 'welcome to ROR demo  grammer check' }
    let(:class_instance) { GrammerCheck.new }

    it 'should start with a Uppercase character' do
      expect(class_instance.check_first_character(test_sentence)).to eq('First character should start with upper case')
    end
    it 'should be one space between the words' do
      expect(class_instance.check_double_space(test_sentence)).to eq('Two spaces are not allowed')
    end
    it 'sentence must end with a full stop(.)' do
      expect(class_instance.check_full_stop(test_sentence)).to eq('Sentence should end with full stop')
    end
    it 'Two continuous upper case characters are not allowed' do
      expect(class_instance.check_double_upcase(test_sentence)).to eq('Two Uppercase characters are not allowed continuously')
    end
  end

end
