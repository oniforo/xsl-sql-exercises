SELECT film.FilmName, film.FilmBoxOfficeDollars - film.FilmBudgetDollars 'Net Profit'
FROM tblActor actor
JOIN tblCast [cast] ON
	actor.ActorID = [cast].CastActorID
RIGHT JOIN tblFilm film ON
	[cast].CastFilmID = film.FilmID
WHERE actor.ActorName = 'Will Smith'
ORDER BY 'Net Profit' DESC
