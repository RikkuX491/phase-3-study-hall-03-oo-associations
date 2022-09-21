class Instructor

    # The name of the Instructor
    attr_accessor :name

    # The students that this Instructor teaches. The Phases that this Instructor teaches
    attr_reader :students, :phases

    # Contains all of the Instructors
    @@all = []

    # initialize an Instructor. Each Instructor has a name
    def initialize(name)

        # If the Instructor already exists, display an error message
        raise ArgumentError, "Instructor already exists!" if Instructor.find(name) != nil

        # Initialize the name of the Instructor
        @name = name

        # One to Many - An instructor has many students
        @students = []

        # Many to Many - An Instructor teaches many Phases and vice versa
        @phases = []

        # Add the Instructor to this array containing all of the Instructors created
        @@all << self
    end

    # Returns the array containing all of the Instructors
    def self.all
        @@all
    end

    # Find a specific Instructor by their name
    def self.find(name)
        self.all.find{
            |i| i.name == name
        }
    end

    # Add a Student that this Instructor will teach
    def add_student(student)
        @students << student
    end

    # Add a Phase that will be taught by this Instructor (add by Phase number value)
    def add_phase(number)

        # If the Phase does not exist, display an error message
        raise ArgumentError, "Phase does not exist!" if Phase.find(number) == nil

        # If the Instructor already teaches this Phase, display an error message
        raise ArgumentError, "Instructor already teaches this Phase!" if self.phases.find{|p| p.number == number} != nil

        # Otherwise, add the Phase to the array of phases for this Instructor
        @phases << Phase.find(number)

        # Add this Instructor to the array of instructors for that Phase
        Phase.find(number).instructors << self
    end

end