class User < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id, 
        class_name: :Enrollment

        #need to a through for enrolled courses
        has_many :enrolled_courses
        through: :enrollments, #current 
        source: :course     #gets us to 

end
