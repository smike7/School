//
//  SchoolTests.swift
//  SchoolTests
//
//  Created by Faisal on 07/12/2022.
//

import XCTest
@testable import School

final class SchoolTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - Student struct tests
    func testNoGradeAvailable() {
        let student = Student(name: "Faisal", grades: [], major: .Finance)
        XCTAssertEqual(student.gpa, nil)
    }
    func testCorrectGradeAverage() {
        let student = Student(name: "Faisal", grades: [1,2,3,4,10,6,2], major: .IT)
        XCTAssertEqual(student.gpa, 4)
    }
    
    //MARK: - School struct test
    func testTopStudentsWithFourTopStudents() {
        let school = School(students: [
            Student(name: "Faisal", grades: [1,2,3,4,10,6,3,5], major: .Finance),
            Student(name: "Ahmed", grades: [1,2,3,4,10,6,3,3], major: .IT),
            Student(name: "Saleh", grades: [1,2,3,4,10,4,2,7], major: .IT),
            Student(name: "Fahad", grades: [1,2,3,4,10,9,5,10], major: .IT),
            Student(name: "khalid", grades: [], major: .Finance),
            Student(name: "Samer", grades: [], major: .Finance),
        ])
        XCTAssertFalse(school.topStudents.isEmpty)
        XCTAssertEqual(school.topStudents.count, 4)
        // first student in school
        XCTAssertEqual(school.topStudents.first?.name, "Fahad")
        // last top students in school
        XCTAssertEqual(school.topStudents.last?.name, "Ahmed")
    }
    
    func testNoTopStudentInLanguages() {
        let school = School(students: [
            Student(name: "Faisal", grades: [1,2,3,4,10,6,3,5], major: .Finance),
            Student(name: "Ahmed", grades: [1,2,3,4,10,6,3,3], major: .IT),
            Student(name: "Saleh", grades: [1,2,3,4,10,4,2,7], major: .IT),
            Student(name: "Fahad", grades: [1,2,3,4,10,9,5,10], major: .IT),
            Student(name: "khalid", grades: [], major: .Finance),
            Student(name: "Samer", grades: [], major: .Finance),
        ])
        
        XCTAssertNil(school.topStudentInLanguages)
    }
    func testNoTopStudents() {
        let school = School(students: [Student(name: "Faisal", grades: [], major: .Finance), Student(name: "Ahmed", grades: [], major: .IT)])
        XCTAssertTrue(school.topStudents.isEmpty)
    }
    
    func testNoFailingStudents() {
        let school = School(students: [Student(name: "Faisal", grades: [1,2,3,4,10,6,3], major: .Finance), Student(name: "Ahmed", grades: [1,2,3,4,10], major: .IT)])
        XCTAssertTrue(school.failingStudents.isEmpty)
    }
    
}
