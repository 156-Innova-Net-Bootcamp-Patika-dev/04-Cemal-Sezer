using Microsoft.AspNetCore.Mvc;
using StudentsManagementapi.Fake;
using StudentsManagementapi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace StudentsManagementapi.Controller
{
    [Route("api/[controller]")]
    public class StudentController:ControllerBase
    {
        private List<Student> students = FakeData.GetStudents(10);
       
        [HttpGet]
        public List<Student> Get()
        {
            return students;
        }

        [HttpGet("{id}")]
        public Student Get(int id)
        {
            var student = students.FirstOrDefault(x => x.ID == id);
            return student;
        }

        [HttpPost]
        public Student Post([FromBody]Student student)
        {
            students.Add(student);
            return student;
        }

        [HttpPut]
        public Student Put([FromBody] Student student)
        {
            var editedStudent = students.FirstOrDefault(x => x.ID == student.ID);
            editedStudent.Name = student.Name;
            editedStudent.Surname = student.Surname;
            return student;
        }

        [HttpDelete]
        public void Delete(int id)
        {
            var deletedStudent= students.FirstOrDefault(x => x.ID == id);
            students.Remove(deletedStudent);
        }
    }
}
