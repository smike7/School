//
//  Student.swift
//  School
//
//  Created by Faisal on 07/12/2022.
//

import Foundation

enum Major {
    case IT, Finance, Languages
}
struct Student {
    var name: String
    var grades: [Float]
    var major: Major
    
    var gpa: Float? {
        guard !grades.isEmpty else {return nil}
        return grades.reduce(0, +) / Float(grades.count)
    }
}
