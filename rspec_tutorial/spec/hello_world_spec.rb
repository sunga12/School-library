class HelloWorld
  def say_hello
    'Hello World!'
  end
end


describe HelloWorld do
  context 'When testing the HelloWorld class' do
    it "should say 'Hello World' when we call the say_hello method" do
      hw = HelloWorld.new
      message = hw.say_hello
      expect(message).to eq 'Hello World!'
    end
  end
end

# DESCRIBE: define an “Example Group”. You can think of an “Example Group” as a collection of tests.
# The describe keyword can take a class name and/or string argument.
# You also need to pass a block argument to describe, this will contain the individual tests
# or as they are known in RSpec, the “Examples”.
# The block is just a Ruby block designated by the Ruby do/end keywords.

describe HelloWorld do
  # CONTEXT: add more details about the examples that it contains.
  # can accept a class name and/or string argument. You should use a block with context as well.
  context 'When re-testing the HelloWorld class' do
    #   IT: define an “Example”. An example is basically a test or a test case.
    #   Again, like describe and context, it accepts both class name and string arguments
    #    and should be used with a block argument, designated with do/end.
    #   In the case of it, it is customary to only pass a string and block argument.
    #   The string argument often uses the word “should” and is meant to describe
    #     what specific behavior should happen inside the it block.
    #   In other words, it describes that expected outcome is for the Example.
    it 'Should return Hello World' do
      # ACT
      hw = HelloWorld.new
      message = hw.say_hello
      # EXPECT: define an “Expectation” in RSpec. This is a verification step where we check,
      # that a specific expected condition has been met.
      expect(message).to eq 'Hello World!'
    end
  end
end
