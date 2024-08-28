// Extensions/EmployeeExtensions.cs
using practical7.Models;

namespace practical7.Extensions
{
    public static class EmployeeExtensions
    {
        public static string GetFullName(this Employee employee)
        {
            return $"{employee.FirstName} {employee.LastName}";
        }
    }
}
