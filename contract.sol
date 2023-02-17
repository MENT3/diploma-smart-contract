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

    constructor(SchoolData memory _school) {
        SchoolData memory school;
        school = _school;

        owner = msg.sender; 
        emit SchoolDataSet(school);
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

    constructor(StudentData memory _student) {
        StudentData memory std;

        std = _student;
        emit StudentSet(std);
    }

    function linkToCompany(address _company_address) public {
        // TODO Some checks (address exist ?, authorisation)
        company_address = _company_address;
        emit CompanyAddressSet(company_address);
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

    constructor(DiplomaData memory _diploma) {
        DiplomaData memory diploma;

        diploma = _diploma;
        emit DiplomaDataSet(diploma);
    }

    function linkToRelations(address _student_address, address _school_address) public { // TODO change naming
        // TODO Some checks (address exist ?, authorisation)
        student_address = _student_address;
        school_address = _school_address;
        emit DiplomaRealtionsSet(student_address, school_address);
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

    constructor(CompanyData memory _company) {
        CompanyData memory company;

        company = _company;
        emit CompanyDataSet(company);
    }
}

