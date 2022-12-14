import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.wrappers;

const string MANAGEMENTSYSTEM_DESC = "0A166D616E6167656D656E7453797374656D2E70726F746F12104D616E6167656D656E7453797374656D1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22720A0E5265676973746572436F7572736512240A0D73747564656E744E756D626572180120012805520D73747564656E744E756D62657212200A0B73747564656E744E616D65180220012809520B73747564656E744E616D6512180A076D6F64756C657318032003280952076D6F64756C65732299010A0753747564656E7412240A0D73747564656E744E756D626572180120012805520D73747564656E744E756D62657212200A0B73747564656E744E616D65180220012809520B73747564656E744E616D6512460A1172656769737465726564436F757273657318032003280B32182E4D616E6167656D656E7453797374656D2E436F75727365521172656769737465726564436F757273657322410A0853747564656E747312350A0873747564656E747318012003280B32192E4D616E6167656D656E7453797374656D2E53747564656E74520873747564656E747322480A06436F75727365121E0A0A636F75727365436F6465180120012805520A636F75727365436F6465121E0A0A636F757273654E616D65180220012809520A636F757273654E616D65228A010A0455736572121A0A08757365727479706518012001280952087573657274797065121A0A08757365724E616D651802200128095208757365724E616D6512160A06757365724944180320012805520675736572494412320A07636F757273657318042003280B32182E4D616E6167656D656E7453797374656D2E436F757273655207636F7572736573226C0A0C436F75727365576569676874121E0A0A636F757273654E616D65180120012809520A636F757273654E616D6512240A0D6173736573736D656E74734E6F180220012805520D6173736573736D656E74734E6F12160A067765696768741803200128055206776569676874224F0A094173736573736F727312220A0C6173736573736F724E616D65180120012809520C6173736573736F724E616D65121E0A0A636F757273654E616D65180220012809520A636F757273654E616D6522520A0A41737369676E6D656E7412240A0D73747564656E744E756D626572180120012809520D73747564656E744E756D626572121E0A0A636F757273654E616D65180220012809520A636F757273654E616D65222D0A1161737369676E6D656E74526573756C747312180A07726573756C74731801200128055207726573756C747322230A07526573756C747312180A07726573756C74731801200128055207726573756C747332F2040A104D616E6167656D656E7453797374656D124C0A0F636F757273655F726567697374657212192E4D616E6167656D656E7453797374656D2E53747564656E741A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565280112450A0B6372656174655F7573657212162E4D616E6167656D656E7453797374656D2E557365721A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124D0A107375626D697441737369676E6D656E7412192E4D616E6167656D656E7453797374656D2E53747564656E741A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565280112420A0A676574526573756C747312192E4D616E6167656D656E7453797374656D2E53747564656E741A192E4D616E6167656D656E7453797374656D2E526573756C747312460A0A616464436F757273657312182E4D616E6167656D656E7453797374656D2E436F757273651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75652801124D0A0B6173736573736D656E7473121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1E2E4D616E6167656D656E7453797374656D2E436F75727365576569676874280112500A0F61737369676E4173736573736F7273121B2E4D616E6167656D656E7453797374656D2E4173736573736F72731A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756528013001124D0A06617373657373121C2E4D616E6167656D656E7453797374656D2E41737369676E6D656E741A232E4D616E6167656D656E7453797374656D2E61737369676E6D656E74526573756C74733001620670726F746F33";

public isolated client class ManagementSystemClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, MANAGEMENTSYSTEM_DESC);
    }

    isolated remote function getResults(Student|ContextStudent req) returns Results|grpc:Error {
        map<string|string[]> headers = {};
        Student message;
        if req is ContextStudent {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ManagementSystem.ManagementSystem/getResults", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Results>result;
    }

    isolated remote function getResultsContext(Student|ContextStudent req) returns ContextResults|grpc:Error {
        map<string|string[]> headers = {};
        Student message;
        if req is ContextStudent {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("ManagementSystem.ManagementSystem/getResults", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Results>result, headers: respHeaders};
    }

    isolated remote function course_register() returns Course_registerStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("ManagementSystem.ManagementSystem/course_register");
        return new Course_registerStreamingClient(sClient);
    }

    isolated remote function create_user() returns Create_userStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("ManagementSystem.ManagementSystem/create_user");
        return new Create_userStreamingClient(sClient);
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

    isolated remote function assess(Assignment|ContextAssignment req) returns stream<assignmentResults, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        Assignment message;
        if req is ContextAssignment {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ManagementSystem.ManagementSystem/assess", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        AssignmentResultsStream outputStream = new AssignmentResultsStream(result);
        return new stream<assignmentResults, grpc:Error?>(outputStream);
    }

    isolated remote function assessContext(Assignment|ContextAssignment req) returns ContextAssignmentResultsStream|grpc:Error {
        map<string|string[]> headers = {};
        Assignment message;
        if req is ContextAssignment {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("ManagementSystem.ManagementSystem/assess", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        AssignmentResultsStream outputStream = new AssignmentResultsStream(result);
        return {content: new stream<assignmentResults, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function assignAssessors() returns AssignAssessorsStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("ManagementSystem.ManagementSystem/assignAssessors");
        return new AssignAssessorsStreamingClient(sClient);
    }
}

public client class Course_registerStreamingClient {
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

public client class Create_userStreamingClient {
    private grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
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

public class AssignmentResultsStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|assignmentResults value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|assignmentResults value;|} nextRecord = {value: <assignmentResults>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
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

public client class ManagementSystemResultsCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendResults(Results response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextResults(ContextResults response) returns grpc:Error? {
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

public type ContextUserStream record {|
    stream<User, error?> content;
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

public type ContextAssignment record {|
    Assignment content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextResults record {|
    Results content;
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
public type Assignment record {|
    string studentNumber = "";
    string courseName = "";
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type User record {|
    string usertype = "";
    string userName = "";
    int userID = 0;
    Course[] courses = [];
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type Students record {|
    Student[] students = [];
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type Results record {|
    int results = 0;
|};

@protobuf:Descriptor {value: MANAGEMENTSYSTEM_DESC}
public type RegisterCourse record {|
    int studentNumber = 0;
    string studentName = "";
    string[] modules = [];
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
    Course[] registeredCourses = [];
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

