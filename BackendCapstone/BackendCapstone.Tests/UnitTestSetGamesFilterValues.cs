using System;
using Xunit;
using System.Collections.Generic;
using BackendCapstone.DataAccess;

namespace BackendCapstone.Tests
{
    public class UnitTestSetGamesFilterValues
    {

        [Fact]
        public void When_user_does_not_select_an_age_filter_then_all_age_ids_get_passed_to_sql_query()
        {
            // Arrange (Given, Context)
            // Given these parameters:
            // the user ID:
            List<int> ageFilterValuesSelected = null;

            List<int> currentAges = new List<int>() { 1, 2, 3, 4, 5 };

            // and this expected result:
            List<int> expectedResult = currentAges;

            // and using methods from this repository:
            var gameWithMetadataRepo = new GameWithMetadataRepository();


            // Act (When) -- ANCA: THIS IS WHERE I CALL A METHOD FROM A REPO FILE???? 
            // IF I JUST WANTED TO CHECK THE USER ID - should I write a new method in the Repo for it??? Even if I don't need it for the app itself??
            var solution = gameWithMetadataRepo.EnsureValidFilterValuesAge(ageFilterValuesSelected);

            // Assert (Then)
            Assert.Equal(expectedResult, solution);
        }

        // Arrange (Given, Context)

        // Act (When)

        // Assert (Then)

    }
}
