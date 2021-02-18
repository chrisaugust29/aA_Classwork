class User < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id, 
        class_name: :Enrollment

        #need to a through for enrolled courses 
end
