import Foundation

/*
 
 */

enum StudentType {
    case undergraduate
    case postgraduate
    case unknown
}

enum JobType {
    case parttime
    case fulltime
}

struct Student {
    var name: String
    var age: Int
    var type: StudentType
    var jobs: [JobType]?
}

struct StudentCard {
    var student: Student
    var cardID: String
}


let studentsList = [
    Student(name: "Bob", age: 20, type: .undergraduate, jobs: nil),
    Student(name: "Leo", age: 19, type: .undergraduate, jobs: nil),
    Student(name: "Yoji", age: 21, type: .undergraduate, jobs: nil),
    Student(name: "David", age: 22, type: .undergraduate, jobs: nil),
    Student(name: "Yifei", age: 22, type: .postgraduate, jobs: nil),
    Student(name: "Robin", age: 22, type: .postgraduate, jobs: nil),
    Student(name: "Lan", age: 23, type: .postgraduate, jobs: [.parttime, .fulltime]),
    Student(name: "John", age: 23, type: .postgraduate, jobs: [.fulltime])
]

func checkMap() {
    
    /* map provide a way to transform the list to a list of other type
       we can use .map to get a list of somthing related to the original list
     */
    
    let cardsList = studentsList.map { (student) -> StudentCard in
        return StudentCard(student: student, cardID: UUID().uuidString)
    }
    
    let names = studentsList.map ({ $0.name })
    
    print(cardsList)
    print(names)
}

func checkCompactMap() {
    let jobs = studentsList.map { $0.jobs }
    // output: [nil, nil, nil, nil, nil, nil, [JobType.parttime, JobType.fulltime], [JobType.fulltime]]

    let compactJobs = studentsList.compactMap { $0.jobs }
    //output: [[JobType.parttime, JobType.fulltime], [JobType.fulltime]]
    
    print(jobs)
    print(compactJobs)
}

func checkFilter() {
    let filteredList = studentsList.filter { return $0.age > 20 }
    print("number of all students: \(studentsList.count)")
    print("number of students older than 20: \(filteredList.count)")
}

func checkReduce() {
    // get total age for average age
    // 0: initial value
    let totalAge = studentsList.reduce(0) { (currentValue, student) -> Int in
        return currentValue + student.age
    }
    let averageAge = totalAge / studentsList.count
    print("average age: \(averageAge)")
    
    // combine jobs of each student into one list
    let jobList = studentsList.compactMap { $0.jobs }.reduce([]) { (jobList, jobs) -> [JobType] in
        return jobList + jobs
    }
    
    print(jobList)
    // outputL [JobType.parttime, JobType.fulltime, JobType.fulltime]
}

func checkHigherOrderFunctions() {
    checkMap()
    checkCompactMap()
    checkFilter()
    checkReduce()
}

checkHigherOrderFunctions()
