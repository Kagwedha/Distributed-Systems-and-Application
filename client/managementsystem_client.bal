import ballerina/io;

ManagementSystemClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Student registerStudentRequest = {studentNumber: 1, studentName: "ballerina", modules: "ballerina"};
    boolean registerStudentResponse = check ep->registerStudent(registerStudentRequest);
    io:println(registerStudentResponse);

    Student getResultsRequest = {studentNumber: 1, studentName: "ballerina", modules: "ballerina"};
    Results getResultsResponse = check ep->getResults(getResultsRequest);
    io:println(getResultsResponse);

    Assignment assessRequest = {studentNumber: "ballerina", courseName: "ballerina"};
    stream<assignmentResults, error?> assessResponse = check ep->assess(assessRequest);
    check assessResponse.forEach(function(assignmentResults value) {
        io:println(value);
    });

    Student submitAssignmentRequest = {studentNumber: 1, studentName: "ballerina", modules: "ballerina"};
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

