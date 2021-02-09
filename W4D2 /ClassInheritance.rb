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

    attr_acccessor :employees 

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    # def add_employee(employee)
    #     @employees << employee
    # end

    def bonus(multiplier)
        (self.employee_salaries) * multiplier
    end

    def employee_salaries
        total = 0
        
        employees


        total
    end

end