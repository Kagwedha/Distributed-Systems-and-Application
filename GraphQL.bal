import ballerina/graphql;

public type CovidEntry record {
    readomly string areaCode;
    decimal date?;
    string region?;
    decimal deaths?;
    decimal confirmed_cases?;
    decimal recoveries?;
    decimal tested?;
    
|};


table<CovidEntry> key(areaCode) covidEntriesTable = table [
    {areCode: "NAM", date: "12/09/2021", region: "Khomas", deaths: 39, confirmed_cases: 465, recoveries: 67, tested: 1200},
];

public distinct service class CovidData 
    private final readonly & CovidEntry entryRecord;

    function updatecovid(CovidEntry entryRecord) {
        self.entryRecord = entryRecord.cloneReadOnly();
    }

    resource function get areaCode() returns string {
        return self.entryRecord.isoCode;
    }

    resource function get date() returns decimal {
        return self.entryRecord.date;
    }

    resource function get region() returns string? {
        if self.entryRecord.region is string {
            return self.entryRecord.region ;
        }
        return;
    }

    resource function get deaths() returns decimal? {
        if self.entryRecord.deaths is decimal {
            return self.entryRecord.deaths / 1000;
        }
        return;
    }

     resource function get confirmed_cases() returns decimal? {
        if self.entryRecord.confirmed cases is decimal {
            return self.entryRecord.confirmed_cases / 1000;
        }
        return;
    }

    resource function get recoveries() returns decimal? {
        if self.entryRecord.recoveries is decimal {
            return self.entryRecord.recoveries / 1000;
        }
        return;
    }

    resource function get tested() returns decimal? {
        if self.entryRecord.tested is decimal {
            return self.entryRecord.tested / 1000;
        }
        return;
    }

    function loadcovidinfo(string areaCode) returns areaCode|error {
   stream<record{}, error> rs = dbCovidinfo->query(`SELECT areCode, date, region, deaths, confirmed_cases, recoveries, tested
                                                 FROM COVIDINFO WHERE areaCode = 
                                                 ${areaCode}`, CovidInfo);
   var rec = check rs.next();
   check rs.close();
   if !(rec is ()) {
       return new areCode(<covidInfo> rec["value"]);
   } else {
       return error(string `Invalid entry: ${areaCode}`);
   }
}

service /covid19 on new graphql:Listener(9000) {
resource function get filter(string isoCode) returns CovidData? {
    CovidEntry? covidEntry = covidEntriesTable[isoCode];
    if covidEntry is CovidEntry {
        return new (covidEntry);
    }
    return;
}

resource function get all() returns CovidData[] {
        CovidEntry[] covidEntries = covidEntriesTable.toArray().cloneReadOnly();
        return covidEntries.map(entry => new CovidData(entry));
    }
}


