-- TO DEMO GAME SEARCH AND FILTERS:
-- GAME SEARCHES

select g.Name, ga.AgeId, a.Name, gi.InstrumentId, i.Name
from Games g
	join GameAges ga
	on ga.GameId = g.Id
		join Ages a
		on a.Id = ga.AgeId
			join GameInstruments gi
			on gi.GameId = g.Id
				join Instruments i
				on gi.InstrumentId = i.Id
where ga.AgeId IN (4,3)
--where gi.InstrumentId IN (3, 2)



-- TO DEMO PRACTICE PLAN WORKFLOWS:
select *
from PracticePlanGames
where PracticePlanId = 74

select *
from PracticePlans
where Id =74
