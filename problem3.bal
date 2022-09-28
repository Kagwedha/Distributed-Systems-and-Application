import ballerina/http;
import ballerina/log;
import ballerina/uuid;


public type Student record {|
   int studentnumber;
   string name;
   string email;
   string courses;
|};
 
 
public type Courses record {|
   int course_code;
   int assesments;
   decimal marks;
|};
 
public type Error record {|
   string code;
   string message;
|};
 
public type ErrorResponse record {|
   Error 'error;
|};
 
public type ValidationError record {|
   *http:BadRequest;
   ErrorResponse body;
|};
 
public type LocationHeader record {|
   string location;
|};
 
public type StudentCreated record {|
   *http:Created;
   LocationHeader headers;
|};
 
public type StudentUpdated record {|
   *http:Ok;
|};
 
service / on new http:Listener(8080) {
 
   private map<Student> students = {};
 
   # + return - List of students
   resource function get students() returns Student[] {
       return self.students.toArray();
   }
 
   # Add a new student
   # + student - Student to be added
   # + return - student created response or validation error
   resource function post students(@http:Studentload Student student) returns StudentCreated|ValidationError {
       if student.name.length() == 0 || student.description.length() == 0 {
           log:printWarn("Student name or description is not entered", student = student);
           return <ValidationError>{
               body: {
                   'error: {
                       code: "INVALID_ENRTY",
                       message: "Student name and description are required"
                   }
               }
           };
       }
 
       if student.courses.course_code < 0d {
           log:printWarn("Student courses cannot be empty", studentt = student);
           return <ValidationError>{
               body: {
                   'error: {
                       code: "INVALID_COURSE_ENTRY",
                       message: "Student courses cannot be null"
                   }
               }
           };
       }
 
       log:printDebug("Adding new student", student = student);
       student.studentnumber = uuid:createType1AsString();
       self.students[<string>studentnumber] = student;
       log:printInfo("Added a new student", student = student);
 
       string studentUrl = string `/students/${<string>studentnumber}`;
       return <StudentCreated>{
           headers: {
               location: studentUrl
           }
       };
   }
 
   # Update student details
   #
   # + student - Updated student
   # + return - A student updated response or an error if student is invalid
   resource function put student(@http:Studentload Student student) returns StudentUpdated|ValidationError {
       if student_number is () || !self.students.hasKey(<string>student_number) {
           log:printWarn("Invalid student information provided for update", student = student);
           return <ValidationError>{
               body: {
                   'error: {
                       code: "INVALID_STUDENT",
                       message: "Invalid student entry"
                   }
               }
           };
       }
 
       log:printInfo("Updating student", student = student);
       self.students[<string>student_number] = student;
       return <StudentUpdated>{};
   }
 
   # Deletes a student record
   #
   # + student_number - student ID
   # + return - Deleted student or a validation error
   resource function delete students/[string student_number]() returns Student|ValidationError {
       if !self.students.hasKey(<string>student_number) {
           log:printWarn("Invalid student number to be deleted", student_number = student_number);
           return {
               body: {
                   'error: {
                       code: "INVALID_STUDENT_NUMBER",
                       message: "Invalid student number"
                   }
               }
           };
       }
 
       log:printDebug("Deleting student record", student_number = student_number);
       Student removed = self.students.remove(student_number);
       log:printDebug("Deleted student record", student = removed);
       return removed;
   }
}