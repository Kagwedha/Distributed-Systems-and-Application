import ballerina/log;
import ballerina/grpc;

Course[] allCourse = [
    {
        courseCode: 0,
        courseName: "PTM"
    }
];

Student[] allStudents = [
    {
        studentNumber: 1,
        studentName: "Helena Shikongo",
        registeredCourses: []
    },
     {
        studentNumber: 1,
        studentName: "Joe-Laizer Shilongo",
        registeredCourses: []
    }

];

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: MANAGEMENTSYSTEM_DESC}
service "ManagementSystem" on ep {

    remote function create_user(stream<User, grpc:Error?> clientStream) returns string|error {
        check clientStream.forEach(function(User value) {

            if (value.usertype == "Student") {
                Student tempStudent = {
                    studentName: value.userName,
                    studentNumber: value.userID,
                    registeredCourses: value.courses
                };
                allStudents.push(tempStudent);
            }
            log:printInfo(value.userName);
        });

        return ("Successfully created student");
    }

    remote function getResults(Student value) returns Results|error {
        return error grpc:UnimplementedError("nothing");
    }
    remote function course_register(stream<Student, grpc:Error?> clientStream) returns string|error {
        return error grpc:UnimplementedError("nothing");
    }
    remote function submitAssignment(stream<Student, grpc:Error?> clientStream) returns string|error {
        return error grpc:UnimplementedError("nothing");
    }
    remote function addCourses(stream<Course, grpc:Error?> clientStream) returns string|error {
        return error grpc:UnimplementedError("nothing");
    }
    remote function assessments(stream<string, grpc:Error?> clientStream) returns CourseWeight|error {
        return error grpc:UnimplementedError("nothing");
    }
    remote function assess(Assignment value) returns stream<assignmentResults, error?>|error {
        return error grpc:UnimplementedError("nothing");
    }
    remote function assignAssessors(stream<Assessors, grpc:Error?> clientStream) returns stream<string, error?>|error {
        return error grpc:UnimplementedError("nothing");
    }
}

