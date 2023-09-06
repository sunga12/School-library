require './spec/spec_helper'

describe Student do
  before :each do
    @student1 = Student.new(34, "Harry", "Ruby")
    @student2 = Student.new(12, "Shrek", "JavaScript")
  end

  before :all do
    p "Student Testing"
  end

  describe "#initialize" do
    context "When making a new Student" do
      it "takes 3 parameters and returns a new Student object" do
        expect(@student1).to be_an_instance_of Student
        expect(@student2).to be_an_instance_of Student
      end

      it "return the correct name" do
        expect(@student1.name).to eq "Harry"
        expect(@student2.name).to eq "Shrek"
      end

      it "return the correct age" do
        expect(@student1.age).to eq 34
        expect(@student2.age).to eq 12
      end

      it "should not create duplicate Persons" do
        expect(@student1).not_to eq @student2
      end

      it "should return the classroom" do
        expect(@student1.classroom).to eql "Ruby"
        expect(@student2.classroom).to eql "JavaScript"
      end

      it "should return the right symbols" do
        expect(@student1.play_hooky).to eq '¯(ツ)/¯'
        expect(@student2.play_hooky).to eq '¯(ツ)/¯'
      end

    end
  end

end