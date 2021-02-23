SELECT actor.ActorID, actor.ActorName, film.FilmName, film.FilmOscarWins
FROM tblActor actor
JOIN tblCast [cast] ON
	actor.ActorID = [cast].CastActorID
RIGHT JOIN tblFilm film ON
	[cast].CastFilmID = film.FilmID
WHERE
	film.FilmName IN (
		SELECT TOP 3 FilmName FROM tblFilm
		WHERE FilmOscarWins IN (
			SELECT DISTINCT TOP 3 FilmOscarWins
			FROM tblFilm
			ORDER BY FilmOscarWins DESC
		)
	)
