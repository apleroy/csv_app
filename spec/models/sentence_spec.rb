require 'rails_helper'

RSpec.describe Sentence, type: :model do

  it "validates the input is not null" do
    sentence = Sentence.new(input: "")
    expect(sentence).to_not be_valid
  end

  it "validates the input is <= 1000 characters" do
    input = "a" * 1001
    sentence = Sentence.new(input: input)
    expect(sentence).to_not be_valid
  end

  context "first_non_repeating_character is correct" do

    it "returns valid for one char" do
      sentence = Sentence.new(input: "a")
      expect(sentence.first_non_repeating_character).to eq("a")
    end

    it "returns valid for two chars ordered" do
      sentence = Sentence.new(input: "ab")
      expect(sentence.first_non_repeating_character).to eq("a")
    end

    it "returns valid for two chars only repeat" do
      sentence = Sentence.new(input: "aa")
      expect(sentence.first_non_repeating_character).to eq(Sentence::ONLY_REPEATS)
    end

    it "returns valid for two chars ordered with whitespace" do
      sentence = Sentence.new(input: "a b")
      expect(sentence.first_non_repeating_character).to eq("a")
    end

    it "returns valid for one char non letter" do
      sentence = Sentence.new(input: ".")
      expect(sentence.first_non_repeating_character).to eq(".")
    end

    it "returns valid for two chars non letter" do
      sentence = Sentence.new(input: ".!")
      expect(sentence.first_non_repeating_character).to eq(".")
    end

    it "returns valid with one repeat" do
      sentence = Sentence.new(input: "ex1e")
      expect(sentence.first_non_repeating_character).to eq("x")
    end

    it "returns valid with two repeats" do
      sentence = Sentence.new(input: "ex1ex")
      expect(sentence.first_non_repeating_character).to eq("1")
    end

    it "returns valid with three repeats" do
      sentence = Sentence.new(input: "ex12ex2")
      expect(sentence.first_non_repeating_character).to eq("1")
    end

    it "returns valid with three repeats - only repeats" do
      sentence = Sentence.new(input: "ex1ex1")
      expect(sentence.first_non_repeating_character).to eq(Sentence::ONLY_REPEATS)
    end

    it "returns valid with 1000 chars" do
      input = "a" * 999
      input += "b"
      sentence = Sentence.new(input: input)
      expect(sentence.first_non_repeating_character).to eq("b")
    end

    it "returns valid with 1000 chars" do
      input = "a" * 999
      input += "b"
      sentence = Sentence.new(input: input)
      expect(sentence.first_non_repeating_character).to eq("b")
    end



  end



end
