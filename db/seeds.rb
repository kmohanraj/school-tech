# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email: "admin@gmail.com", password: "admin@gmail.com", password_confirmation: "admin@gmail.com", role: "admin", name: "admin")



User.create(email: "mohan@gmail.com", password: "mohan@gmail.com", password_confirmation: "mohan@gmail.com", role: "user", name: "mohan")
User.create(email: "sakthi@gmail.com", password: "sakthi@gmail.com", password_confirmation: "sakthi@gmail.com", role: "user", name: "sakthi")
User.create(email: "raj@gmail.com", password: "raj@gmail.com", password_confirmation: "raj@gmail.com", role: "user", name: "rajkumar")
User.create(email: "santhosh@gmail.com", password: "santhosh@gmail.com", password_confirmation: "santhosh@gmail.com", role: "user", name: "santhosh")
User.create(email: "vijay@gmail.com", password: "vijay@gmail.com", password_confirmation: "vijay@gmail.com", role: "user", name: "vijaykumar")

Subject.create(sub_name: "Tamil", sub_code: "TM001", user_id: User.where(role: :admin))
Subject.create(sub_name: "English", sub_code: "ENG002", user_id: User.where(role: :admin))
Subject.create(sub_name: "Mathematics", sub_code: "MM003", user_id: User.where(role: :admin))
Subject.create(sub_name: "Science", sub_code: "SC004", user_id: User.where(role: :admin))
Subject.create(sub_name: "Social Science", sub_code: "SS005", user_id: User.where(role: :admin))


Student.create(student_name: "John kories", student_code: "VT1120")
Student.create(student_name: "Jack Conner", student_code: "VT1121")
Student.create(student_name: "Harry Callum", student_code: "VT1122")
Student.create(student_name: "Charlie kyle", student_code: "VT1123")
Student.create(student_name: "George Reece", student_code: "VT1124")



# Assign Subjects
AssignSubject.create(subject_id: 1, user_id: 2)
AssignSubject.create(subject_id: 2, user_id: 3)
AssignSubject.create(subject_id: 3, user_id: 4)
AssignSubject.create(subject_id: 4, user_id: 5)
AssignSubject.create(subject_id: 5, user_id: 6)

AssignMark.create(mark: 90, subject_id: 4, student_id: 1, user_id: 3)
AssignMark.create(mark: 67, subject_id: 4, student_id: 2, user_id: 3)
AssignMark.create(mark: 60, subject_id: 4, student_id: 3, user_id: 3)
AssignMark.create(mark: 80, subject_id: 4, student_id: 4, user_id: 3)
AssignMark.create(mark: 80, subject_id: 4, student_id: 5, user_id: 3)

AssignMark.create(mark: 80, subject_id: 5, student_id: 1, user_id: 2)
AssignMark.create(mark: 67, subject_id: 5, student_id: 2, user_id: 2)
AssignMark.create(mark: 60, subject_id: 5, student_id: 3, user_id: 2)
AssignMark.create(mark: 60, subject_id: 5, student_id: 4, user_id: 2)
AssignMark.create(mark: 90, subject_id: 5, student_id: 5, user_id: 2)

AssignMark.create(mark: 60, subject_id: 1, student_id: 1, user_id: 6)
AssignMark.create(mark: 55, subject_id: 1, student_id: 2, user_id: 6)
AssignMark.create(mark: 64, subject_id: 1, student_id: 3, user_id: 6)
AssignMark.create(mark: 56, subject_id: 1, student_id: 4, user_id: 6)
AssignMark.create(mark: 90, subject_id: 1, student_id: 5, user_id: 6)

AssignMark.create(mark: 90, subject_id: 2, student_id: 1, user_id: 5)
AssignMark.create(mark: 60, subject_id: 2, student_id: 2, user_id: 5)
AssignMark.create(mark: 67, subject_id: 2, student_id: 3, user_id: 5)
AssignMark.create(mark: 67, subject_id: 2, student_id: 4, user_id: 5)
AssignMark.create(mark: 68, subject_id: 2, student_id: 5, user_id: 5)

AssignMark.create(mark: 90, subject_id: 3, student_id: 1, user_id: 4)
AssignMark.create(mark: 80, subject_id: 3, student_id: 2, user_id: 4)
AssignMark.create(mark: 60, subject_id: 3, student_id: 3, user_id: 4)
AssignMark.create(mark: 67, subject_id: 3, student_id: 4, user_id: 4)
AssignMark.create(mark: 65, subject_id: 3, student_id: 5, user_id: 4)

RankList.create(student_id: 2, total: 339)
RankList.create(student_id: 3, total: 331)
RankList.create(student_id: 4, total: 323)
RankList.create(student_id: 5, total: 395)
RankList.create(student_id: 1, total: 395)
