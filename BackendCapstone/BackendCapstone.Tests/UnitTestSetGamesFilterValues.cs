using System;
using Xunit;
using System.Collections.Generic;
using BackendCapstone.DataAccess;

namespace BackendCapstone.Tests
{
    public class UnitTestSetGamesFilterValues
    {
        // Arrange (Given, Context)

        // Act (When)

        // Assert (Then)


        [Fact]
        public void When_user_does_not_select_an_age_filter_then_all_age_ids_get_passed_to_sql_query()
        {
            // Arrange (Given, Context)
            // Given these parameters:
            List<int> ageFilterValuesSelected = new List<int>();

            List<int> currentAges = new List<int>() { 1, 2, 3, 4, 5 };

            // and this expected result:
            List<int> expectedResult = currentAges;

            // and using methods from this repository:
            var gameWithMetadataRepo = new GameWithMetadataRepository();

            // if I am passing an empty list to this method, then it should return the full list:
            var solution = gameWithMetadataRepo.EnsureValidFilterValuesAge(ageFilterValuesSelected);

            // Assert (Then)
            Assert.Equal(expectedResult, solution);
        }

        [Fact]
        public void When_user_does_not_select_an_instrument_filter_then_all_instrument_ids_get_passed_to_sql_query()
        {
            // Arrange (Given, Context)
            // Given these parameters:
            List<int> instrumentFilterValuesSelected = new List<int>();

            List<int> currentInstruments = new List<int>() { 1, 2, 3, 4, 5, 6, 7 };

            // and this expected result:
            List<int> expectedResult = currentInstruments;

            // and using methods from this repository:
            var gameWithMetadataRepo = new GameWithMetadataRepository();

            var solution = gameWithMetadataRepo.EnsureValidFilterValuesInstrument(instrumentFilterValuesSelected);

            // Assert (Then)
            Assert.Equal(expectedResult, solution);
        }

        [Fact]
        public void When_user_does_not_select_a_preworkLevel_filter_then_all_preworkLevel_ids_get_passed_to_sql_query()
        {
            // Arrange (Given, Context)
            // Given these parameters:
            List<int> preworkLevelFilterValuesSelected = new List<int>();

            List<int> currentPreworkLevels = new List<int>() { 1, 2, 3, 4 };

            // and this expected result:
            List<int> expectedResult = currentPreworkLevels;

            // and using methods from this repository:
            var gameWithMetadataRepo = new GameWithMetadataRepository();

            var solution = gameWithMetadataRepo.EnsureValidFilterValuesPreworkLevel(preworkLevelFilterValuesSelected);

            // Assert (Then)
            Assert.Equal(expectedResult, solution);
        }
    }
}
