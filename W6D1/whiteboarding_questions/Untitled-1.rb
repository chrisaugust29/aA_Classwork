 == Schema Information
#
# Table name: users
#
#  id   :integer                not null, primary key
#  name :string                 not null

# Table name: enrollments
#
#  id   :integer                not null, primary key
#  course_id :integer           not null
#  student_id :integer          not null

# Table name: courses
#
#  id   :integer                not null, primary key
#  course_name :string          not null
#  professor_id :integer        not null
#  prereq_course_id :integer    not null

CLASS Users

has_many :enrollments,
foreign_key: :student_id,
class_name: "Enrollent"

has_many :courses_taught
oreign_key: :professor_id,
class_name: "Course"


CLASS Enrollments
belongs_to :course,
foreign_key: :course_id
class_name: "Course"

belongs_to :user,
foreign_key: :student_id
class_name: "User"




Class Courses

belongs_to :professor,
foreign_key: :professor_id,
class_name: "User"

belongs_to :pre_req,
foreign_key: :prereq_course_id,
class_name: "Course",
optional: true

has_many :enrollments,
oreign_key: :course_id,
class_name: "Enrollments"

