// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

// shool input => ["ynov", "school type", "FR", "42 rue anatole france", "https://ynov.com"]
contract School {
    address private owner;

    struct SchoolData {
        string name;
        string typee;
        string country;
        string addresss;
        string url;
    }

    event SchoolDataSet(SchoolData school);
    SchoolData school;

    constructor(SchoolData memory _school) {
        school = _school;
        owner = msg.sender; 
        emit SchoolDataSet(school);
    }

    function getSchoolName() external view returns(string memory) {
        return school.name;
    }
    
    function getSchoolType() external view returns(string memory) {
        return school.typee;
    }

    function getSchoolCountry() external view returns(string memory) {
        return school.name;
    }
    
    function getSchoolAddress() external view returns(string memory) {
        return school.addresss;
    }
    
    function getSchoolWebSiteURL() external view returns(string memory) {
        return school.url;
    }

}

// student input => ["lastname","firstname","2345","0","nationality","0","948 rue des trucs","falsdjiw@gmail.com","0606060606","0","pfe_subject","company_sate_pfe","01012022","02012022","evaluation"]
contract Student {
    enum Sex { Men, Women }
    enum CivilStatus { A, B, C } // TODO fill with real status
    enum Section { A, B, C } // TODO fill with real status

    struct StudentData {
        string lastname;
        string firstname;
        uint birthdate;
        Sex sex;
        string nationality;
        CivilStatus civil_status;
        string addres;
        string email;
        uint phone;
        Section section;
        string pfe_subject;
        string company_sate_pfe; // TODO what is it ? Find best type
        uint stage_start_date;
        uint stage_end_date;
        string evaluation; // TODO what is it ? Find best type
    }

    event StudentSet(StudentData student);
    event CompanyAddressSet(address company_address);

    address public company_address;
    StudentData std;

    constructor(StudentData memory _student) {

        std = _student;
        emit StudentSet(std);
    }

    function linkToCompany(address _company_address) public {
        // TODO Some checks (address exist ?, authorisation)
        company_address = _company_address;
        emit CompanyAddressSet(company_address);
    }

    function getStudentLastName() external view returns(string memory) {
        return std.lastname;
    }

    function getStudentFirstName() external view returns(string memory) {
        return std.firstname;
    }

    function getStudentBirthDate() external view returns(uint) {
        return std.birthdate;
    }

    function getStudentCivilStatus() external view returns (string memory) {
        if (CivilStatus.A == std.civil_status) return "A";
        if (CivilStatus.B == std.civil_status) return "B";
        if (CivilStatus.C == std.civil_status) return "C";
        return "";
    }

    function getStudentSex() external view returns (string memory) {
        if (Sex.Men == std.sex) return "Men";
        if (Sex.Women == std.sex) return "Women";
        return "";
    }

    function getStudentSection() external view returns (string memory) {
        if (Section.A == std.section) return "A";
        if (Section.B == std.section) return "B";
        if (Section.C == std.section) return "C";
        return "";
    }
    
    function getStudentNationality() external view returns(string memory) {
        return std.nationality;
    }
    
    function getStudentAdress() external view returns(string memory) {
        return std.addres;
    }

    function getStudentEmail() external view returns(string memory) {
        return std.email;
    }

    function getStudentPhoneNumber() external view returns(uint) {
        return std.phone;
    }

    function getStudentPfeSubject() external view returns(string memory) {
        return std.pfe_subject;
    }

    function getStudentCompanyStatePfe() external view returns(string memory) {
        return std.company_sate_pfe;
    }

    function getStudentStageStartDate() external view returns(uint) {
        return std.stage_start_date;
    }

    function getStudentStageEndDate() external view returns(uint) {
        return std.stage_end_date;
    }

    function getStudentEvaluation() external view returns(string memory) {
        return std.evaluation;
    }

}

// diploma input => ["diploma name", "type", "FR", "Info", "mention", "20220901"]
contract Diploma {
    address private owner;

    struct DiplomaData {
        string name;
        string typee;
        string country;
        string speciality;
        string mention;
        string getting_date;
    }

    address public student_address;
    address public school_address;

    event DiplomaDataSet(DiplomaData diploma);
    event DiplomaRealtionsSet(address student_address, address school_address);

    DiplomaData diploma;

    constructor(DiplomaData memory _diploma) {
        diploma = _diploma;
        emit DiplomaDataSet(diploma);
    }

    function linkToRelations(address _student_address, address _school_address) public { // TODO change naming
        // TODO Some checks (address exist ?, authorisation)
        student_address = _student_address;
        school_address = _school_address;
        emit DiplomaRealtionsSet(student_address, school_address);
    }

    function getLinkedStudent() external view returns (address _student_address) {
        // TODO don't just return, find a way to "show" the value to the "user"
        require(student_address != address(0), "aucun etudiant associe a ce diplome");
        return student_address;
    }

    function getDiplomaName() external view returns(string memory) {
        return diploma.name;
    }

    function getDiplomaType() external view returns(string memory) {
        return diploma.typee;
    }

    function getDiplomaCountry() external view returns(string memory) {
        return diploma.country;
    }

    function getDiplomaSpeciality() external view returns(string memory) {
        return diploma.speciality;
    }

    function getDiplomaMention() external view returns(string memory) {
        return diploma.mention;
    }

    function getDiplomaGettingDate() external view returns(string memory) {
        return diploma.getting_date;
    }

}

// company input => ["sanofi", "FR", "sante", "1900", "0", "4 rue des trucs", "contact@sanofi.fr", "0606060606", "https://sanofi.fr"]
contract Company {
    enum CompanySize { A, B, C }
    
    address private owner;

    struct CompanyData {
        string name;
        string country;
        string business_line;
        uint created_at;
        CompanySize size;
        string addresss;
        string email;
        string phone;
        string website;
    }

    event CompanyDataSet(CompanyData company);

    CompanyData company;

    constructor(CompanyData memory _company) {

        company = _company;
        emit CompanyDataSet(company);
    }

    function getCompanyName() external view returns(string memory) {
        return company.name;
    }
    
    function getCompanyCounty() external view returns(string memory) {
        return company.country;
    }
    
    function getCompanyBuisnessLine() external view returns(string memory) {
        return company.business_line;
    }

    function getCompanyCreatedAt() external view returns(uint) {
        return company.created_at;
    }

    function getCompanySize() external view returns (string memory) {
        if (CompanySize.A == company.size) return "A";
        if (CompanySize.B == company.size) return "B";
        if (CompanySize.C == company.size) return "C";
        return "";
    }
        
    function getCompanyAddress() external view returns(string memory) {
        return company.addresss;
    }
    
    function getCompanyEmail() external view returns(string memory) {
        return company.email;
    }
    
    function getCompanyPhoneNumber() external view returns(string memory) {
        return company.phone;
    }

    function getCompanyWebSite() external view returns(string memory) {
        return company.website;
    }


}