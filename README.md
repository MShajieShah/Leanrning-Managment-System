# Leanrning-Managment-System
A user of LMS has three data members: firstName, lastName, password and userName. (may be other data members also). A user can sign in/sign out to LMS system. A user of LMS can be a
- Student
- Instructor
 
A student has two additional data members: roll number and status (status can be freshman, sophomore, junior and senior). A student can:
- View his own marks only
- View resources uploaded by instructor
- View roster of a course (list of students enrolled in a course + instructor(s) offering that course)
- View Assignments of a course
    
 An instructor has two additional data members(designation and qualification).An instructor can:
- Student
- Add/View Marks of all students enrolled in a course being taught by that teacher
- Add/View Resources to a course tab
- View roster of a course (list of students enrolled in a course + instructor(s) offering that course)
- Add/View Assignments of a course


A course has data members: courseName, courseCode and offeringSchool and capacity. (may be other data members also). You are free to add data members to any class.
Make sure that you can’t declare data members of any class public.
When a student logs in to LMS, (s)he will see the list of course tabs in which (s)he is enrolled in. On navigating to particular course tab, a student can view list of resources, assignments, view list of students enrolled in that course and can view his/her marks list only. When an instructor logs in to LMS, he will see the list of courses being taught by him. On navigating to a particular course tab, instructor can view list of resources, add a new resource item to resources list, view list of assignments, add a new assignment to assignment list, add marks of students enrolled in that course, view marks of all students enrolled in that course and view list of students enrolled in that course. [For adding a new assignment/resource, instructor only adds name of assignment/resource or some text as content. Obviously there will be a due date only for assignments.] 
- Requirements:
- Create Interfaces/Abstractions for Users and Course Class.
- Create Interface/Abstractions for Student And Professor Class.
- Override a method getProfile in User class that will print status for Student and designation for a Professor i.e. for Student("Sohail Aslam","senior")
  getProfile prints Sohail Aslam is a senior student at LUMS
- And for a Professor("Habib-ur-Rehman","Assistant Professor") overridden getProfile will print Habib-ur-Rehman is Assistant Professor at LUMS
Overload operators if required
