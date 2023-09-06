require './spec/spec_helper'

describe Book do
  before :each do
    @book1 = Book.new("Harry Potter 1", "JK Rowling")
    @book2 = Book.new("Shrek", "Disney")
  end

  before :all do
    p "Book Testing"
  end

  describe "#initialize" do
    context "When making a new book" do
      it "takes 2 parameters and returns a new book object" do
        expect(@book1).to be_an_instance_of Book
        expect(@book2).to be_an_instance_of Book
      end

      it "return the correct title" do
        expect(@book1.title).to eq "Harry Potter 1"
        expect(@book2.title).to eq "Shrek"
      end

      it "return the correct author" do
        expect(@book1.author).to eq "JK Rowling"
        expect(@book2.author).to eq "Disney"
      end

      it "should not create duplicate books" do
        expect(@book1).not_to eq @book2
      end
    end
  end

end