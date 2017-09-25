class Zoo
  attr_reader :name, :opening_date, :closing_date, :employees, :cages

  def initialize(name, opening_date, closing_date)
    @name = name
    @opening_date = opening_date
    @closing_date = closing_date
    @employees = []
    @cages = [].tap do |cages|
      10.times do
        cages << Cage.new
      end
    end
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date_to_check)
    @opening_date <= date_to_check && @closing_date >= date_to_check
  end

  def add_animal(animal)
    empty_cage = @cages.find{ |cage| cage.empty?}
    if !empty_cage.nil?
      empty_cage.animal = animal
    else
      raise ZooAtCapacity
    end
  end

  def visit
    results = ""
    @employees.each do |employee|
      results << "#{employee.greet}\n"
    end

    @cages.each do |cage|
      results << "#{cage.animal.speak}\n" if !cage.empty?
    end
    results
  end
end
