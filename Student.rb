class Student

    # The name of the Student. The Instructor that teaches this Student
    attr_accessor :name, :instructor

    # Contains all of the Students
    @@all = []

    # initialize a Student. Each Student has a name and Instructor
    # The Instructor's name is passed in as the second argument
    def initialize(name, instructor)

        # If the Student already exists, display an error message
        raise ArgumentError, "Student already exists!" if Student.find(name) != nil

        # If the Instructor does not exist, display an error message
        raise ArgumentError, "Instructor not found!" if Instructor.find(instructor) == nil
        
        # Initialize the name of the Student
        @name = name

        # Initialize the Instructor that will teach this Student
        @instructor = Instructor.find(instructor)

        # Add this Student to the array of students that the Instructor teaches
        @instructor.add_student(self)
        
        # Add this Student to this array containing all of the Students created
        @@all << self
    end

    # Returns the array containing all of the Students
    def self.all
        @@all
    end

    # Find a specific Student by their name
    def self.find(name)
        self.all.find{
            |s| s.name == name
        }
    end

end