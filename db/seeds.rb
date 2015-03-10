Question.create!([
  {question: "q1", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 2, topiccode: 2, stopiccode: 2},
  {question: "q2", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 2, topiccode: 3, stopiccode: 2},
  {question: "q3", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 2, topiccode: 4, stopiccode: 3},
  {question: "q4", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 2, topiccode: 2, stopiccode: 4},
  {question: "q5", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 2, topiccode: 3, stopiccode: 3},
  {question: "q6", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 3, topiccode: 5, stopiccode: 4},
  {question: "q7", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 3, topiccode: 6, stopiccode: 2},
  {question: "q8", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 3, topiccode: 7, stopiccode: 3},
  {question: "q9", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 3, topiccode: 5, stopiccode: 4},
  {question: "q10", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 3, topiccode: 6, stopiccode: 2},
  {question: "q11", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 4, topiccode: 8, stopiccode: 3},
  {question: "q12", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 4, topiccode: 9, stopiccode: 2},
  {question: "q13", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 4, topiccode: 10, stopiccode: 3},
  {question: "q14", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 4, topiccode: 8, stopiccode: 4},
  {question: "q15", opa: "1", opb: "1", opc: "1", opd: "1", ro: "A", year: "2014-12-12", examcode: 1, subjectcode: 4, topiccode: 9, stopiccode: 2},
  {question: "<p>Question 16</p>\r\n\r\n<p><img alt=\"\" src=\"http://www.joomlaworks.net/images/demos/galleries/abstract/7.jpg\" style=\"height:267px; width:400px\" /></p>\r\n", opa: "<p>A</p>\r\n", opb: "<p>B</p>\r\n", opc: "<p>C</p>\r\n", opd: "<p>D</p>\r\n", ro: "C", year: "2015-01-14", examcode: 1, subjectcode: 1, topiccode: 1, stopiccode: 1},
  {question: "<p>a</p>\r\n", opa: "<p>a</p>\r\n", opb: "<p>a</p>\r\n", opc: "<p>a</p>\r\n", opd: "<p>a</p>\r\n", ro: "A", year: "2015-01-17", examcode: 1, subjectcode: 2, topiccode: 5, stopiccode: 1}
])
Scode.create!([
  {scode: 1, sname: "All"},
  {scode: 2, sname: "Physics"},
  {scode: 3, sname: "Chemistry"},
  {scode: 4, sname: "Maths"}
])
Subtopiccode.create!([
  {stcode: 1, stname: "All subtopics", topiccode_id: 1, active: "Y"},
  {stcode: 2, stname: "Supto1", topiccode_id: 2, active: "Y"},
  {stcode: 3, stname: "Supto2", topiccode_id: 3, active: "Y"},
  {stcode: 4, stname: "Supto3", topiccode_id: 4, active: "Y"},
  {stcode: 5, stname: "Supto4", topiccode_id: 4, active: "Y"}
])
Topiccode.create!([
  {tcode: 1, tname: "All topics", scode_id: 1, active: "Y"},
  {tcode: 2, tname: "Dynamics", scode_id: 2, active: "Y"},
  {tcode: 3, tname: "Mechanics", scode_id: 2, active: "Y"},
  {tcode: 4, tname: "Electrostatics", scode_id: 2, active: "Y"},
  {tcode: 5, tname: "Organic", scode_id: 3, active: "Y"},
  {tcode: 6, tname: "Inorganic", scode_id: 3, active: "Y"},
  {tcode: 7, tname: "Physical", scode_id: 3, active: "Y"},
  {tcode: 8, tname: "Topology", scode_id: 4, active: "Y"},
  {tcode: 9, tname: "Coordinate", scode_id: 4, active: "Y"},
  {tcode: 10, tname: "Calculus", scode_id: 4, active: "Y"}
])
