    namespace P_07.Extensions;
    using P_07.Models;

    public static class EmployeeExtensions{

        public static bool isEligibleForRetirement(this Employee employee){
            return employee.age >=50;
        }
    }