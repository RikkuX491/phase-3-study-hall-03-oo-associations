class Phase

    # The topic of the Phase
    attr_accessor :topic

    # The number value of the Phase. The instructors that teach this Phase
    attr_reader :number, :instructors

    # Contains all of the Phases
    @@all = []

    # initialize a Phase. Each Phase has a number value and a topic
    def initialize(number, topic)
        
        # If the Phase already exists, display an error message
        raise ArgumentError, "Phase already exists!" if Phase.find(number) != nil

        # Initialize the number value and topic of the Phase
        @number = number
        @topic = topic

        # Many to Many - A Phase has been taught by many Instructors and vice versa
        @instructors = []

        # Add the Phase to this array containing all of the Phases created
        @@all << self
    end

    # Returns the array containing all of the Phases
    def self.all
        @@all
    end

    # Find a specific Phase by its number value
    def self.find(number)
        self.all.find{
            |p| p.number == number
        }
    end

    # Add an Instructor that will teach this Phase (add by Instructor name)
    def add_instructor(name)

        # If the Instructor does not exist, display an error message
        raise ArgumentError, "Instructor does not exist!" if Instructor.find(name) == nil

        # If this Phase is already taught by the Instructor, display an error message
        raise ArgumentError, "Phase is already taught by this Instuctor!" if self.instructors.find{|i| i.name == name} != nil

        # Otherwise, add the Instructor to the array of instructors for this Phase
        @instructors << Instructor.find(name)

        # Add this Phase to the array of phases for that Instructor
        Instructor.find(name).phases << self
    end

end