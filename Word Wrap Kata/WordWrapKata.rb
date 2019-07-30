# rspec WordWrapKata.rb
require "rspec/autorun"

def wrap(string, max_length)
    return string if string.length <= max_length
    white_space = string[0... max_length].rindex(" ") || max_length
    string[0...white_space].strip + "\n" + wrap(string[white_space..-1].strip, white_space)
end


describe "wrap" do
    it "returns empty string when called with nothing" do
        expect(wrap("", 1)).to eq("")
    end
    
    it "returns the word if shorter than the length" do
        expect(wrap("word", 5)).to eq("word")
    end
    
    it "splits a long word on the length column" do
        expect(wrap("wordwrap", 4)).to eq("word\nwrap")
    end
    
    it "splits a really long word on the column" do
        expect(wrap("wordwrapkata", 4)).to eq("word\nwrap\nkata")    
    end
    
    it "splits a word on a whitespace" do
        expect(wrap("word wrap", 5)).to eq("word\nwrap")
    end
#    
    it "splits a whitespace before the column" do
        expect(wrap("word wrap", 4)).to eq("word\nwrap")
    end
    
    it "splits early when the space is before column" do
    expect(wrap("word wrap", 6)).to eq("word\nwrap")
    end
    
    it "keepts as many words on the line as possible" do
        expect(wrap("word wrap kata", 10)).to eq("word wrap\nkata")
    end
    
end