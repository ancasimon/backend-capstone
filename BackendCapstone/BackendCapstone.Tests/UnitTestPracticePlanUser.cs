using BackendCapstone.DataAccess;
using BackendCapstone.Models;
using System;
using Xunit;
using Microsoft.Extensions.Configuration;


namespace BackendCapstone.Tests
{
    public class UnitTestPracticePlanUser
    {
        readonly string _connectionString;
        _connectionString = Microsoft.Extensions.Configuration.GetConnectionString("BackendCapstone");

        [Fact]
        public void when_user_creates_practice_plan_his_user_id_should_be_on_the_new_plan_record()
        {
            // Arrange (Given, Context)
            // Given these parameters:
            // the user ID:
            var currentUserId = 1;
            // a new practice plan object:
            PracticePlan newPPObject = new PracticePlan()
            {
                Name = "test plan",
                UserId = currentUserId,
                StartDate = "2021-02-01",
                EndDate = "2020-02-15",
                IsActive = true,
            };

            // and this expected result:
            PracticePlan expectedResult = new PracticePlan()
            {
                Name = "test plan",
                UserId = 1,
                StartDate = "2021-02-01",
                EndDate = "2020-02-15",
                IsActive = true,
            };

            // and using methods from this repository:
            var ppRepo = new PracticePlanRepository(_connectionString);


            // Act (When) -- ANCA: THIS IS WHERE I CALL A METHOD FROM A REPO FILE???? 
            // IF I JUST WANTED TO CHECK THE USER ID - should I write a new method in the Repo for it??? Even if I don't need it for the app itself??
            var solution = ppRepo.AddPracticePlanAndReturnFullObject(currentUserId, newPPObject);

            // Assert (Then)
            Assert.Equal(expectedResult, solution);
        }

        // Arrange (Given, Context)

        // Act (When)

        // Assert (Then)

    }
}
