import ballerina/io;

Course[] allCourse = [
    {
        courseCode: 0,
        courseName: "PTM"
    }
];

ManagementSystemClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Student getResultsRequest = {studentNumber: 1, studentName: "ballerina", registeredCourses: [{courseCode: 1, courseName: "ballerina"}]};
    Results getResultsResponse = check ep->getResults(getResultsRequest);
    io:println(getResultsResponse);

    Assignment assessRequest = {studentNumber: "ballerina", courseName: "ballerina"};
    stream<assignmentResults, error?> assessResponse = check ep->assess(assessRequest);
    check assessResponse.forEach(function(assignmentResults value) {
        io:println(value);
    });

    User create_userRequest = {usertype: "ballerina", userName: "ballerina", userID: 1, courses: [{courseCode: 1, courseName: "ballerina"}]};
    Create_userStreamingClient create_userStreamingClient = check ep->create_user();
    check create_userStreamingClient->sendUser(create_userRequest);
    check create_userStreamingClient->complete();
    string? create_userResponse = check create_userStreamingClient->receiveString();
    io:println(create_userResponse);

    Student submitAssignmentRequest = {studentNumber: 1, studentName: "ballerina", registeredCourses: [{courseCode: 1, courseName: "ballerina"}]};
    SubmitAssignmentStreamingClient submitAssignmentStreamingClient = check ep->submitAssignment();
    check submitAssignmentStreamingClient->sendStudent(submitAssignmentRequest);
    check submitAssignmentStreamingClient->complete();
    string? submitAssignmentResponse = check submitAssignmentStreamingClient->receiveString();
    io:println(submitAssignmentResponse);

    Course addCoursesRequest = {courseCode: 1, courseName: "ballerina"};
    AddCoursesStreamingClient addCoursesStreamingClient = check ep->addCourses();
    check addCoursesStreamingClient->sendCourse(addCoursesRequest);
    check addCoursesStreamingClient->complete();
    string? addCoursesResponse = check addCoursesStreamingClient->receiveString();
    io:println(addCoursesResponse);

    string assessmentsRequest = "ballerina";
    AssessmentsStreamingClient assessmentsStreamingClient = check ep->assessments();
    check assessmentsStreamingClient->sendString(assessmentsRequest);
    check assessmentsStreamingClient->complete();
    CourseWeight? assessmentsResponse = check assessmentsStreamingClient->receiveCourseWeight();
    io:println(assessmentsResponse);

    Assessors assignAssessorsRequest = {assessorName: "ballerina", courseName: "ballerina"};
    AssignAssessorsStreamingClient assignAssessorsStreamingClient = check ep->assignAssessors();
    check assignAssessorsStreamingClient->sendAssessors(assignAssessorsRequest);
    check assignAssessorsStreamingClient->complete();
    string? assignAssessorsResponse = check assignAssessorsStreamingClient->receiveString();
    io:println(assignAssessorsResponse);
}

public function registering(string userName, string userUsertype, int userUserID, Course[] userCourses) returns error? {
    Student[] tempallStudents = [];

    //io:println("Available Courses: ", allCourse);

    //string courseCode = io:readln("Enter Course code to Register: ");

    Student tempStudent = {
        studentNumber: userUserID,
        studentName: userName,
        registeredCourses: [
            {
                courseName: "",
                courseCode: 0
            }
        ]
    };
    tempallStudents.push(tempStudent);

    //Student course_registerRequest = {studentNumber: 1, studentName: "ballerina", registeredCourses: [{courseCode: 1, courseName: "ballerina"}]};
    Course_registerStreamingClient course_registerStreamingClient = check ep->course_register();

    foreach Student val in tempallStudents {
        check course_registerStreamingClient->sendStudent(val);
    }
    check course_registerStreamingClient->complete();
    string? receiveString = check course_registerStreamingClient->receiveString();
    io:println(receiveString);
    if !(receiveString is ()) {
        io:println("Server Response: ", receiveString);
        studentOptions(userName, userUsertype, userUserID, userCourses);
    }

}

function studentOptions(string s, string s1, int i, Course[] a) {

}
