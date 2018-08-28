# coding: utf-8
# frozen_string_literal: false

require 'simple_clipboard'

describe SimpleClipboard do
  describe "#get_text" do
    it "should return the value set by set_text" do
      expected = "Hello world"
      SimpleClipboard.set_text expected
      actual = SimpleClipboard.get_text
      expect(actual).to eq(expected)
    end

    it "should return the same value when called twice in a row" do
      expected = "Hello world"
      SimpleClipboard.set_text expected
      actual1 = SimpleClipboard.get_text
      actual2 = SimpleClipboard.get_text
      expect(actual1).to eq(actual2)
    end

    it "should raise ArgumentError if any arguments are provided" do
      expect { SimpleClipboard.get_text "hello world" }.to raise_error(ArgumentError)
    end
  end

  describe "#set_text" do
    it "should return the previous contents of the clipboard" do
      expected = "first"
      SimpleClipboard.set_text expected
      actual = SimpleClipboard.set_text "second"
      expect(actual).to eq(expected)
    end

    it "should raise ArgumentError if no arguments are provided" do
      expect { SimpleClipboard.set_text }.to raise_error(ArgumentError)
    end

    it "should raise ArgumentError if two arguments are provided" do
      expect { SimpleClipboard.set_text "hello", "world" }.to raise_error(ArgumentError)
    end

    it "should raise ArgumentError if more than two arguments are provided" do
      expect { SimpleClipboard.set_text "hello", "sweet", "world" }.to raise_error(ArgumentError)
    end

    it "should raise TypeError if first argument is not a string" do
      expect { SimpleClipboard.set_text 123 }.to raise_error(TypeError)
    end
  end
end
