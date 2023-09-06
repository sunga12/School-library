require './spec/spec_helper'

describe Teacher do
  before :each do
    @teacher1 = Teacher.new(34, "Harry", "Doctor")
    @teacher2 = Teacher.new(45, "Shrek", "Engineer")
  end

  before :all do
    p "Teacher Testing"
  end

  describe "#initialize" do
    context "When making a new Teacher" do
      it "takes 3 parameters and returns a new Teacher object" do
        expect(@teacher1).to be_an_instance_of Teacher
        expect(@teacher2).to be_an_instance_of Teacher
      end

      it "return the correct name" do
        expect(@teacher1.correct_name).to eq "Harry"
        expect(@teacher2.correct_name).to eq "Shrek"
      end

      it "return the correct age" do
        expect(@teacher1.age).to eq 34
        expect(@teacher2.age).to eq 45
      end

      it "should not create duplicate Persons" do
        expect(@teacher1).not_to eq @teacher2
      end

      it "should return the correct specialization" do
        expect(@teacher1.specialization).to eql "Doctor" 
        expect(@teacher2.specialization).to eql "Engineer"
      end

      it "should return the correct can_use_services status" do
        expect(@teacher1.can_use_services?).to be true
        expect(@teacher2.can_use_services?).to be true
      end

    end
  end

end