class Employee

    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        (self.salary) * multiplier
    end

end

class Manager < Employee

    attr_accessor :employees 

    def initialize(name, title, salary, boss)
        super
        @employees = [] 
    end

    def add_employee(employee)
        @employees << employee
    end

    def bonus(multiplier)
        (self.employee_salaries) * multiplier
    end

    def employee_salaries
        total = 0
        queue = [] 
        queue += self.employees
        while !queue.empty?
            current = queue.shift 
            total += current.salary 
            queue += current.employees if current.is_a?(Manager)
        end

        total
    end

end

ned = Manager.new("ned", "founder", 1000000, nil)
darren = Manager.new("darren", "taManager", 78000, "ned")
shawna = Employee.new("shawna", "ta", 12000, "darren")
david = Employee.new("david", "ta", 10000, darren)
ned.add_employees(darren)
darren.add_employees(shawna)
darren.add_employees(david)


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000