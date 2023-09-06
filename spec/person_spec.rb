require './spec/spec_helper'

describe Person do
  before :each do
    @person1 = Person.new(34, "Harry")
    @person2 = Person.new(12, "Shrek")
  end

  before :all do
    p "Person Testing"
  end

  describe "#initialize" do
    context "When making a new Person" do
      it "takes 2 parameters and returns a new Person object" do
        expect(@person1).to be_an_instance_of Person
        expect(@person2).to be_an_instance_of Person
      end

      it "return the correct name" do
        expect(@person1.correct_name).to eq "Harry"
        expect(@person2.correct_name).to eq "Shrek"
      end

      it "return the correct age" do
        expect(@person1.age).to eq 34
        expect(@person2.age).to eq 12
      end

      it "should not create duplicate Persons" do
        expect(@person1).not_to eq @person2
      end

      it "should return the correct of_age? status" do
        expect(@person1.of_age?).to be true
        expect(@person2.of_age?).to be false
      end

      it "should return the correct can_use_services status" do
        expect(@person1.can_use_services?).to be true
        expect(@person2.can_use_services?).to be true
      end

    end
  end

end