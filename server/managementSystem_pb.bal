import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.wrappers;
import ballerina/grpc.types.wrappers as swrappers;

const string MANAGEMENTSYSTEM_DESC = "0A166D616E6167656D656E7453797374656D2E70726F746F12104D616E6167656D656E7453797374656D1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F226B0A0753747564656E7412240A0D73747564656E744E756D626572180120012805520D73747564656E744E756D62657212200A0B73747564656E744E616D65180220012809520B73747564656E744E616D6512180A076D6F64756C657318032001280952076D6F64756C657322720A0E53747564656E7450726F66696C6512240A0D73747564656E744E756D626572180120012805520D73747564656E744E756D62657212200A0B73747564656E744E616D65180220012809520B73747564656E744E616D6512180A076D6F64756C657318032001280952076D6F64756C657322480A06436F75727365121E0A0A636F75727365436F6465180120012805520A636F75727365436F6465121E0A0A636F757273654E616D65180220012809520A636F757273654E616D65226C0A0C436F75727365576569676874121E0A0A636F757273654E616D65180120012809520A636F757273654E616D6512240A0D6173736573736D656E74734E6F180220012805520D6173736573736D656E74734E6F12160A067765696768741803200128055206776569676874224F0A094173736573736F727312220A0C6173736573736F724E616D65180120012809520C6173736573736F724E616D65121E0A0A636F757273654E616D65180220012809520A636F757273654E616D6522520A0A41737369676E6D656E7412240A0D73747564656E744E756D626572180120012809520D73747564656E744E756D626572121E0A0A636F757273654E616D65180220012809520A636F757273654E616D65222D0A1161737369676E6D656E74526573756C747312180A07726573756C74731801200128055207726573756C747332B7040A104D616E6167656D656E7453797374656D124E0A0F726567697374657253747564656E7412192E4D616E6167656D656E7453797374656D2E53747564656E741A202E4D616E6167656D656E7453797374656D2E53747564656E7450726F66696C65124D0A107375626D697441737369676E6D656E7412192E4D616E6167656D656E7453797374656D2E53747564656E741A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124A0A0A676574526573756C7473121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565300112460A0A616464436F757273657312182E4D616E6167656D656E7453797374656D2E436F757273651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124D0A0B6173736573736D656E7473121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1E2E4D616E6167656D656E7453797374656D2E436F75727365576569676874280112500A0F61737369676E4173736573736F7273121B2E4D616E6167656D656E7453797374656D2E4173736573736F72731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756528013001124F0A06617373657373121C2E4D616E6167656D656E7453797374656D2E41737369676E6D656E741A232E4D616E6167656D656E7453797374656D2E61737369676E6D656E74526573756C747328013001620670726F746F33";

public isolated client class ManagementSystemClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, MANAGEMENTSYSTEM_DESC);
    }

    isolated remote function registerStudent(Student|ContextStudent req) returns StudentProfile|grpc:Error {
        map<string|string[]> headers = {};
        Student message;
        if req is ContextStudent {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ManagementSystem.ManagementSystem/registerStudent", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <StudentProfile>result;
    }

    isolated remote function registerStudentContext(Student|ContextStudent req) returns ContextStudentProfile|grpc:Error {
        map<string|string[]> headers = {};
        Student message;
        if req is ContextStudent {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ManagementSystem.ManagementSystem/registerStudent", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <StudentProfile>result, headers: respHeaders};
    }

    isolated remote function submitAssignment() returns SubmitAssignmentStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("ManagementSystem.ManagementSystem/submitAssignment");
        return new SubmitAssignmentStreamingClient(sClient);
    }

    isolated remote function addCourses() returns AddCoursesStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("ManagementSystem.ManagementSystem/addCourses");
        return new AddCoursesStreamingClient(sClient);
    }

    isolated remote function assessments() returns AssessmentsStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("ManagementSystem.ManagementSystem/assessments");
        return new AssessmentsStreamingClient(sClient);
    }

    isolated remote function getResults(string|wrappers:ContextString req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ManagementSystem.ManagementSystem/getResults", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function getResultsContext(string|wrappers:ContextString req) returns wrappers:ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ManagementSystem.ManagementSystem/getResults", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        swrappers:StringStream outputStream = new swrappers:StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function assignAssessors() returns AssignAssessorsStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("ManagementSystem.ManagementSystem/assignAssessors");
        return new AssignAssessorsStreamingClient(sClient);
    }

    isolated remote function assess() returns AssessStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("ManagementSystem.ManagementSystem/assess");
        return new AssessStreamingClient(sClient);
    }
}

public client class SubmitAssignmentStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendStudent(Student message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextStudent(ContextStudent message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class AddCoursesStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendCourse(Course message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextCourse(ContextCourse message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class AssessmentsStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendString(string message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextString(wrappers:ContextString message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveCourseWeight() returns CourseWeight|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <CourseWeight>payload;
        }
    }

    isolated remote function receiveContextCourseWeight() returns ContextCourseWeight|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <CourseWeight>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class AssignAssessorsStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendAssessors(Assessors message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextAssessors(ContextAssessors message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveString() returns string|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return payload.toString();
        }
    }

    isolated remote function receiveContextString() returns wrappers:ContextString|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: payload.toString(), headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class AssessStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendAssignment(Assignment message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextAssignment(ContextAssignment message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveAssignmentResults() returns assignmentResults|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <assignmentResults>payload;
        }
    }

    isolated remote function receiveContextAssignmentResults() returns ContextAssignmentResults|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <assignmentResults>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public client class ManagementSystemAssignmentResultsCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendAssignmentResults(assignmentResults response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextAssignmentResults(ContextAssignmentResults response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class ManagementSystemCourseWeightCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCourseWeight(CourseWeight response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCourseWeight(ContextCourseWeight response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class ManagementSystemStudentProfileCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendStudentProfile(StudentProfile response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextStudentProfile(ContextStudentProfile response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class ManagementSystemStringCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(wrappers:ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextAssignmentStream record {|
    stream<Assignment, error?> content;
    map<string|string[]> headers;
|};

public type ContextAssessorsStream record {|
    stream<Assessors, error?> content;
    map<string|string[]> headers;
|};

public type ContextStudentStream record {|
    stream<Student, error?> content;
    map<string|string[]> headers;
|};

public type ContextCourseStream record {|
    stream<Course, error?> content;
    map<string|string[]> headers;
|};

public type ContextAssignmentResultsStream record {|
    stream<assignmentResults, error?> content;
    map<string|string[]> headers;
|};

public type ContextStudentProfile record {|
    StudentProfile content;
    map<string|string[]> headers;
|};

public type ContextAssignment record {|
    Assignment content;
    map<string|string[]> headers;
|};

public type ContextCourseWeight record {|
    CourseWeight content;
    map<string|string[]> headers;
|};

public type ContextAssessors record {|
    Assessors content;
    map<string|string[]> headers;
|};

public type ContextStudent record {|
    Student content;
    map<string|string[]> headers;
|};

public type ContextCourse record {|
    Course content;
    map<string|string[]> headers;
|};

public type ContextAssignmentResults record {|
    assignmentResults content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type StudentProfile record {|
    int studentNumber = 0;
    string studentName = "";
    string modules = "";
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type Assignment record {|
    string studentNumber = "";
    string courseName = "";
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type CourseWeight record {|
    string courseName = "";
    int assessmentsNo = 0;
    int weight = 0;
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type Assessors record {|
    string assessorName = "";
    string courseName = "";
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type Student record {|
    int studentNumber = 0;
    string studentName = "";
    string modules = "";
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type Course record {|
    int courseCode = 0;
    string courseName = "";
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type assignmentResults record {|
    int results = 0;
|};

