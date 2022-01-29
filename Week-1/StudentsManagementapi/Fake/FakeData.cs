using StudentsManagementapi.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Bogus;

namespace StudentsManagementapi.Fake
{
    public static class FakeData
    {
        private static List<Student> students;
        public static List<Student> GetStudents(int number)
        {
            if (students == null)
            {//fake kullanıcıları çekiyoruz
                students = new Faker<Student>()
           .RuleFor(s => s.ID, f => f.IndexFaker + 10)
           .RuleFor(s => s.Name, f => f.Name.FirstName())
           .RuleFor(s => s.Surname, f => f.Name.LastName())
           .Generate(number);
            }
            return students;


        }
    }
}
