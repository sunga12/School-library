require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown')
    super(age, name)
    @classroom = 'classroom'
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.includes?(self)
  end
end
