// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs

Table Courses {
  course_id integer
  course_name varchar
  created_at timestamp 
  teacher_id integer
}

Table Users {
  id integer [primary key]
  user_name varchar
  role varchar
  created_at timestamp
  email varchar
  password varchar
}

Table Lessons {
  lesson_id integer [primary key]
  lesson_title varchar
  course_id integer
  created_at timestamp
  lesson_number integer
}

Table Students {
  student_id integer
  student_name varchar
  created_at timestamp
  course_id integer
}

Table Grades {
  grade_id integer
  created_at timestamp
  student_id varchar
  course_id integer
  lesson_id integer
  grade integer
}

Table Messages {
  user_id integer
  created_at timestamp
  message_id integer
}


Ref: "Users"."id" < "Courses"."teacher_id"

Ref: "Messages"."user_id" < "Users"."id"

Ref: "Grades"."student_id" < "Users"."id"

Ref: "Grades"."student_id" < "Students"."student_id"

Ref: "Grades"."course_id" < "Students"."course_id"

Ref: "Lessons"."course_id" < "Students"."course_id"

Ref: "Lessons"."lesson_id" < "Grades"."lesson_id"

Ref: "Courses"."course_id" < "Lessons"."course_id"