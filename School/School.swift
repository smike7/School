//
//  School.swift
//  School
//
//  Created by Faisal on 07/12/2022.
//

import Foundation

struct School {
    var students: [Student]
    var topStudents: [Student] {
        topStudents(with: 4)
    }
    var failingStudents: [Student] {
        failingStudents(with: 1)
    }
    var topStudentInIT: Student? {
        return topStudentIn(major: .IT)
    }
    var topStudentInFinance: Student? {
        return topStudentIn(major: .Finance)
    }
    var topStudentInLanguages: Student? {
        return topStudentIn(major: .Languages)
    }
}

private extension School {
    func topStudents(with gpa: Float) -> [Student] {
        students.filter {
            guard let studentGPA = $0.gpa else {return false}
            return studentGPA >= gpa
        }.sorted{$0.gpa! > $1.gpa!}
    }
    func failingStudents(with gpa: Float) -> [Student] {
        students.filter{
            guard let studentGpA = $0.gpa else {return false}
            return studentGpA <= gpa
        }
    }
    func topStudentIn(major: Major) -> Student? {
        let topStudent = students.filter {
            $0.major == major
        }
        .sorted {
            guard let s1GPA = $0.gpa,
                  let s2GPA = $1.gpa
            else {return false}
            return s1GPA > s2GPA
        }
        return topStudent.first == nil ? nil : topStudentInIT! 
    }
}
