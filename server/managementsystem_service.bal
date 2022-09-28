import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:Descriptor {value: MANAGEMENTSYSTEM_DESC}
service "ManagementSystem" on ep {

    remote function registerStudent(Student value) returns boolean|error {
    }
    remote function getResults(Student value) returns Results|error {
    }
    remote function submitAssignment(stream<Student, grpc:Error?> clientStream) returns string|error {
    }
    remote function addCourses(stream<Course, grpc:Error?> clientStream) returns string|error {
    }
    remote function assessments(stream<string, grpc:Error?> clientStream) returns CourseWeight|error {
    }
    remote function assess(Assignment value) returns stream<assignmentResults, error?>|error {
    }
    remote function assignAssessors(stream<Assessors, grpc:Error?> clientStream) returns stream<string, error?>|error {
    }
}

