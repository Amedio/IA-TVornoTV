; Fri May 27 17:52:59 CEST 2011
; 
;+ (version "3.4.4")
;+ (build "Build 579")


(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
	(single-slot ClasEdades
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot ActorFav
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CDirector
		(type INSTANCE)
;+		(allowed-classes Director)
		(create-accessor read-write))
	(single-slot PorcentajeMujeres
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot NombreDirector
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Idioma
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Capitulos
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Titulo
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Duracion
;+		(comment "Duracion en minutos")
		(type INTEGER)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Nombre
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Color_BN
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Sexo
		(type SYMBOL)
		(allowed-values hombre mujer)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot NombreApellido
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Idiomas
		(type STRING)
		(create-accessor read-write))
	(single-slot DirectorFav
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Edad
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot GeneroDetestado
		(type INSTANCE)
;+		(allowed-classes Genero)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Tematica
		(type SYMBOL)
		(allowed-values Naturaleza Ciencia Actualidad Historia Arte Politica Economia)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CProductor
		(type INSTANCE)
;+		(allowed-classes Productor)
		(create-accessor read-write))
	(multislot CActor
		(type INSTANCE)
;+		(allowed-classes Actor)
		(create-accessor read-write))
	(single-slot AnyoContenido
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Temporadas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PorcentajeHombres
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CGenero
		(type INSTANCE)
;+		(allowed-classes Genero)
		(create-accessor read-write))
	(single-slot Puntuacion
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot EnEmision
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Nacionalidad
		(type STRING)
		(create-accessor read-write)))

(defclass ProgramaTv
	(is-a USER)
	(role concrete)
	(single-slot ClasEdades
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CDirector
		(type INSTANCE)
;+		(allowed-classes Director)
		(create-accessor read-write))
	(single-slot PorcentajeHombres
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PorcentajeMujeres
		(type FLOAT)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Color_BN
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Idioma
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot AnyoContenido
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Puntuacion
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Titulo
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Duracion
;+		(comment "Duracion en minutos")
		(type INTEGER)
		(default 0)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Nacionalidad
		(type STRING)
		(cardinality 1 ?VARIABLE)
		(create-accessor read-write)))

(defclass Pelicula
	(is-a ProgramaTv)
	(role concrete)
	(multislot CGenero
		(type INSTANCE)
;+		(allowed-classes Genero)
		(create-accessor read-write))
	(multislot CActor
		(type INSTANCE)
;+		(allowed-classes Actor)
		(create-accessor read-write))
	(multislot CProductor
		(type INSTANCE)
;+		(allowed-classes Productor)
		(create-accessor read-write)))

(defclass Serie
	(is-a ProgramaTv)
	(role concrete)
	(single-slot Temporadas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CGenero
		(type INSTANCE)
;+		(allowed-classes Genero)
		(create-accessor read-write))
	(multislot CActor
		(type INSTANCE)
;+		(allowed-classes Actor)
		(create-accessor read-write))
	(single-slot Capitulos
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CProductor
		(type INSTANCE)
;+		(allowed-classes Productor)
		(create-accessor read-write))
	(single-slot EnEmision
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Documental
	(is-a ProgramaTv)
	(role concrete)
	(single-slot Tematica
		(type SYMBOL)
		(allowed-values Naturaleza Ciencia Actualidad Historia Arte Politica Economia)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Persona
	(is-a USER)
	(role concrete)
	(single-slot NombreApellido
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Nacionalidad
		(type STRING)
		(create-accessor read-write)))

(defclass Productor
	(is-a Persona)
	(role concrete))

(defclass Director
	(is-a Persona)
	(role concrete))

(defclass Actor
	(is-a Persona)
	(role concrete))

(defclass Compositor
	(is-a Persona)
	(role concrete))

(defclass Genero
	(is-a USER)
	(role concrete)
	(single-slot Nombre
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass Usuario
	(is-a USER)
	(role concrete)
	(single-slot DirectorFav
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Edad
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot ActorFav
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot GeneroDetestado
		(type INSTANCE)
;+		(allowed-classes Genero)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Idiomas
		(type STRING)
		(create-accessor read-write))
	(single-slot Sexo
		(type SYMBOL)
		(allowed-values hombre mujer)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Nacionalidad
		(type STRING)
		(create-accessor read-write)))

(definstances tvornotv
([tvornotv_Class0] of  Serie

	(AnyoContenido 2006)
	(CActor
		[tvornotv_Class2]
		[tvornotv_Class3]
		[tvornotv_Class4])
	(Capitulos 24)
	(CDirector [tvornotv_Class5])
	(CGenero [tvornotv_Class10043])
	(CProductor [tvornotv_Class6])
	(Duracion 23)
	(EnEmision FALSE)
	(Idioma "ingles")
	(Nacionalidad "Inglaterra")
	(Temporadas 4)
	(Titulo "The IT Crowd"))

([tvornotv_Class10] of  Director

	(NombreApellido "Paul Scheuring"))

([tvornotv_Class10012] of  Actor

	(NombreApellido "Dominic Purcell"))

([tvornotv_Class10013] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Wentworth Miller"))

([tvornotv_Class10014] of  Actor

	(Nacionalidad "Puerto Rico")
	(NombreApellido "Amaury Nolasco"))

([tvornotv_Class10015] of  Productor

	(NombreApellido "Adelstein-Parouse Productions"))

([tvornotv_Class10016] of  Pelicula

	(AnyoContenido 1973)
	(CActor
		[tvornotv_Class13]
		[tvornotv_Class10017])
	(CDirector [tvornotv_Class12])
	(CGenero
		[tvornotv_Class10039]
		[tvornotv_Class10037])
	(ClasEdades 12)
	(CProductor
		[tvornotv_Class10027]
		[tvornotv_Class10028])
	(Duracion 118)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Titulo "El emperador del Norte"))

([tvornotv_Class10017] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Ernest Borgnine"))

([tvornotv_Class10018] of  Pelicula

	(AnyoContenido 1997)
	(CActor
		[tvornotv_Class10020]
		[tvornotv_Class10024]
		[tvornotv_Class10025]
		[tvornotv_Class10026])
	(CDirector [tvornotv_Class10019])
	(CGenero [tvornotv_Class10043])
	(ClasEdades 18)
	(CProductor
		[tvornotv_Class10022]
		[tvornotv_Class10023])
	(Duracion 120)
	(Idioma "castellano")
	(Nacionalidad "España")
	(Titulo "Airbag"))

([tvornotv_Class10019] of  Director

	(Nacionalidad "Espana")
	(NombreApellido "Juanma Bajo"))

([tvornotv_Class10020] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Karlos Arguinano"))

([tvornotv_Class10022] of  Productor

	(NombreApellido "Adrian Lipp"))

([tvornotv_Class10023] of  Productor

	(Nacionalidad "Espana")
	(NombreApellido "Inaki Burrutxaga"))

([tvornotv_Class10024] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Pilar Bardem"))

([tvornotv_Class10025] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Santiago Segura"))

([tvornotv_Class10026] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Carlos Faemino"))

([tvornotv_Class10027] of  Productor

	(NombreApellido "Stanley Hough"))

([tvornotv_Class10028] of  Productor

	(NombreApellido "Kenneth Hyman"))

([tvornotv_Class10029] of  Pelicula

	(AnyoContenido 1987)
	(CActor
		[tvornotv_Class10047]
		[tvornotv_Class10048]
		[tvornotv_Class10049]
		[tvornotv_Class10050])
	(CDirector [tvornotv_Class10045])
	(CGenero
		[tvornotv_Class10034]
		[tvornotv_Class10036]
		[tvornotv_Class10043])
	(ClasEdades 7)
	(CProductor
		[tvornotv_Class10044]
		[tvornotv_Class10046])
	(Duracion 98)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Titulo "The Princess Bride"))

([tvornotv_Class10030] of  Productor

	(NombreApellido "Raymond Anzarut"))

([tvornotv_Class10034] of  Genero

	(Nombre "Aventuras"))

([tvornotv_Class10036] of  Genero

	(Nombre "Fantasia"))

([tvornotv_Class10037] of  Genero

	(Nombre "Accion"))

([tvornotv_Class10038] of  Genero

	(Nombre "Belica"))

([tvornotv_Class10039] of  Genero

	(Nombre "Drama"))

([tvornotv_Class10040] of  Genero

	(Nombre "Espionaje"))

([tvornotv_Class10041] of  Productor

	(Nacionalidad "EEUU")
	(NombreApellido "Albert Romolo Broccoli"))

([tvornotv_Class10042] of  Productor

	(Nacionalidad "Canada")
	(NombreApellido "Harry Saltzman"))

([tvornotv_Class10043] of  Genero

	(Nombre "Comedia"))

([tvornotv_Class10044] of  Productor

	(NombreApellido "Andrew Scheiman"))

([tvornotv_Class10045] of  Director

	(NombreApellido "Rob Reiner"))

([tvornotv_Class10046] of  Productor

	(NombreApellido "Rob Reiner"))

([tvornotv_Class10047] of  Actor

	(NombreApellido "Robin Wright"))

([tvornotv_Class10048] of  Actor

	(NombreApellido "Cary Elwes"))

([tvornotv_Class10049] of  Actor

	(NombreApellido "Mandy Patinkin"))

([tvornotv_Class10050] of  Actor

	(NombreApellido "Chris Sarandon"))

([tvornotv_Class10051] of  Serie

	(AnyoContenido 1963)
	(CActor
		[tvornotv_Class10054]
		[tvornotv_Class10055])
	(Capitulos 776)
	(CGenero
		[tvornotv_Class10039]
		[tvornotv_Class10053])
	(ClasEdades 0)
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "Inglaterra")
	(Temporadas 6)
	(Titulo "Dr. Who"))

([tvornotv_Class10052] of  Director

	(NombreApellido "Tom Hanks"))

([tvornotv_Class10053] of  Genero

	(Nombre "CienciaFiccion"))

([tvornotv_Class10054] of  Actor

	(NombreApellido "Matt Smith"))

([tvornotv_Class10055] of  Actor

	(NombreApellido "David Tennant"))

([tvornotv_Class10056] of  Serie

	(AnyoContenido 2005)
	(CActor
		[tvornotv_Class10049]
		[tvornotv_Class10061]
		[tvornotv_Class10062]
		[tvornotv_Class10063])
	(Capitulos 138)
	(CDirector [tvornotv_Class10057])
	(CGenero
		[tvornotv_Class10058]
		[tvornotv_Class10039]
		[tvornotv_Class10059]
		[tvornotv_Class10060])
	(ClasEdades 16)
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Temporadas 6)
	(Titulo "Mentes Criminales"))

([tvornotv_Class10057] of  Director

	(NombreApellido "Jeff Davis"))

([tvornotv_Class10058] of  Genero

	(Nombre "Policiaco"))

([tvornotv_Class10059] of  Genero

	(Nombre "Criminologia"))

([tvornotv_Class10060] of  Genero

	(Nombre "Forenses"))

([tvornotv_Class10061] of  Actor

	(NombreApellido "Thomas Gibson"))

([tvornotv_Class10062] of  Actor

	(NombreApellido "Shemar Moore"))

([tvornotv_Class10063] of  Actor

	(NombreApellido "Matthew Grey Gubler"))

([tvornotv_Class10064] of  Serie

	(AnyoContenido 2000)
	(CActor
		[tvornotv_Class10065]
		[tvornotv_Class10066]
		[tvornotv_Class10067]
		[tvornotv_Class10068])
	(CDirector [tvornotv_Class10069])
	(ClasEdades 13)
	(CProductor [tvornotv_Class10070])
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Temporadas 11)
	(Titulo "CSI: Las Vegas"))

([tvornotv_Class10065] of  Actor

	(NombreApellido "Lawrence Fishburne"))

([tvornotv_Class10066] of  Actor

	(NombreApellido "William Petersen"))

([tvornotv_Class10067] of  Actor

	(NombreApellido "Marg Heigenberger"))

([tvornotv_Class10068] of  Actor

	(NombreApellido "George Eads"))

([tvornotv_Class10069] of  Director

	(NombreApellido "Anthony E. Zuiker"))

([tvornotv_Class10070] of  Productor

	(NombreApellido "Jerry Bruckheimer"))

([tvornotv_Class10071] of  Serie

	(AnyoContenido 2011)
	(CActor
		[tvornotv_Class10076]
		[tvornotv_Class10077]
		[tvornotv_Class10078])
	(Capitulos 3)
	(CDirector
		[tvornotv_Class10073]
		[tvornotv_Class10074]
		[tvornotv_Class10075])
	(CGenero [tvornotv_Class10072])
	(ClasEdades 18)
	(CProductor [tvornotv_Class10079])
	(Duracion 60)
	(EnEmision TRUE)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Temporadas 1)
	(Titulo "Juego de Tronos"))

([tvornotv_Class10072] of  Genero

	(Nombre "Fantasia medieval"))

([tvornotv_Class10073] of  Director

	(NombreApellido "David Benioff"))

([tvornotv_Class10074] of  Director

	(NombreApellido "D. B. Weiss"))

([tvornotv_Class10075] of  Director

	(NombreApellido "George R. R. Martin"))

([tvornotv_Class10076] of  Actor

	(NombreApellido "Mark Addy"))

([tvornotv_Class10077] of  Actor

	(NombreApellido "Afie Alien"))

([tvornotv_Class10078] of  Actor

	(NombreApellido "Sean Bean"))

([tvornotv_Class10079] of  Productor

	(NombreApellido "David Benioff"))

([tvornotv_Class10080] of  Serie

	(AnyoContenido 2001)
	(CActor
		[tvornotv_Class10084]
		[tvornotv_Class10085]
		[tvornotv_Class10086])
	(Capitulos 11)
	(CDirector
		[tvornotv_Class10052]
		[tvornotv_Class10083])
	(CGenero
		[tvornotv_Class10037]
		[tvornotv_Class10038])
	(ClasEdades 18)
	(CProductor
		[tvornotv_Class10081]
		[tvornotv_Class10082])
	(Duracion 60)
	(Idioma "ingles")
	(Nacionalidad
		"EEUU"
		"Reino Unido")
	(Temporadas 1)
	(Titulo "Band of Brothers"))

([tvornotv_Class10081] of  Productor

	(NombreApellido "Steven Spielberg"))

([tvornotv_Class10082] of  Productor

	(NombreApellido "Tom Hanks"))

([tvornotv_Class10083] of  Director

	(NombreApellido "Mark Cowen"))

([tvornotv_Class10084] of  Actor

	(NombreApellido "Ron Livingston"))

([tvornotv_Class10085] of  Actor

	(NombreApellido "James McAvoy"))

([tvornotv_Class10086] of  Actor

	(NombreApellido "Stephen Graham"))

([tvornotv_Class11] of  Pelicula

	(AnyoContenido 1967)
	(CActor
		[tvornotv_Class13]
		[tvornotv_Class14]
		[tvornotv_Class15])
	(CDirector [tvornotv_Class12])
	(CGenero
		[tvornotv_Class10037]
		[tvornotv_Class10038])
	(ClasEdades 12)
	(CProductor
		[tvornotv_Class10030]
		[tvornotv_Class10028])
	(Duracion 145)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Titulo "Los doce del patibulo"))

([tvornotv_Class12] of  Director

	(Nacionalidad "EEUU")
	(NombreApellido "Robert Aldrich"))

([tvornotv_Class13] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Lee Marvin"))

([tvornotv_Class14] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Charles Bronson"))

([tvornotv_Class15] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Donald Sutherland"))

([tvornotv_Class16] of  Documental

	(AnyoContenido 1985)
	(CDirector [tvornotv_Class17])
	(ClasEdades 0)
	(Duracion 60)
	(Idioma "castellano")
	(Nacionalidad "España")
	(Tematica Naturaleza)
	(Titulo "El lince ibérico"))

([tvornotv_Class17] of  Director

	(NombreApellido "Felix Rodriguez de la Fuente"))

([tvornotv_Class18] of  Pelicula

	(AnyoContenido 1962)
	(CActor [tvornotv_Class23])
	(CDirector [tvornotv_Class19])
	(CGenero
		[tvornotv_Class10037]
		[tvornotv_Class10040])
	(ClasEdades 7)
	(Color_BN TRUE)
	(CProductor
		[tvornotv_Class10041]
		[tvornotv_Class10042])
	(Duracion 110)
	(Idioma "ingles")
	(Nacionalidad "Inglaterra")
	(Titulo "Dr. No"))

([tvornotv_Class19] of  Director

	(NombreApellido "Terence Young"))

([tvornotv_Class2] of  Actor

	(Nacionalidad "Irlanda")
	(NombreApellido "Chris O'Dowd"))

([tvornotv_Class20016] of  Productor

	(NombreApellido "20th Century Fox Television"))

([tvornotv_Class20017] of  Serie

	(AnyoContenido 2010)
	(CActor
		[tvornotv_Class20020]
		[tvornotv_Class20021]
		[tvornotv_Class20022])
	(Capitulos 19)
	(CDirector [tvornotv_Class20018])
	(CGenero
		[tvornotv_Class20019]
		[tvornotv_Class10039]
		[tvornotv_Class10053])
	(ClasEdades 14)
	(CProductor [tvornotv_Class20023])
	(Duracion 60)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 2)
	(Titulo "The Walking Dead"))

([tvornotv_Class20018] of  Director

	(Nacionalidad "Francia")
	(NombreApellido "Frank Darabont"))

([tvornotv_Class20019] of  Genero

	(Nombre "Terror"))

([tvornotv_Class20020] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Andrew Lincoln"))

([tvornotv_Class20021] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Jon Bernthal"))

([tvornotv_Class20022] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Sarah Wayne Callies"))

([tvornotv_Class20023] of  Productor

	(Nacionalidad "Francia")
	(NombreApellido "Frank Darabont"))

([tvornotv_Class20024] of  Serie

	(AnyoContenido 1994)
	(CActor
		[tvornotv_Class20029]
		[tvornotv_Class20030]
		[tvornotv_Class20031])
	(Capitulos 238)
	(CDirector
		[tvornotv_Class20025]
		[tvornotv_Class20027])
	(CGenero
		[tvornotv_Class10043]
		[tvornotv_Class9])
	(ClasEdades 14)
	(CProductor
		[tvornotv_Class20026]
		[tvornotv_Class20028])
	(Duracion 22)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 10)
	(Titulo "Friends"))

([tvornotv_Class20025] of  Director

	(Nacionalidad "USA")
	(NombreApellido "David Crane"))

([tvornotv_Class20026] of  Productor

	(NombreApellido "Marta Kauffman"))

([tvornotv_Class20027] of  Director

	(NombreApellido "Marta Kauffman"))

([tvornotv_Class20028] of  Productor

	(Nacionalidad "USA")
	(NombreApellido "David Crane"))

([tvornotv_Class20029] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Jennifer Aniston"))

([tvornotv_Class20030] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Courteney Cox"))

([tvornotv_Class20031] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Lisa Kudrow"))

([tvornotv_Class20032] of  Serie

	(AnyoContenido 1989)
	(CActor
		[tvornotv_Class20035]
		[tvornotv_Class20036])
	(Capitulos 486)
	(CDirector [tvornotv_Class20033])
	(CGenero
		[tvornotv_Class10043]
		[tvornotv_Class20034])
	(CProductor [tvornotv_Class20016])
	(Duracion 22)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 22)
	(Titulo "The Simpsons"))

([tvornotv_Class20033] of  Director

	(Nacionalidad "USA")
	(NombreApellido "Matt Groening"))

([tvornotv_Class20034] of  Genero

	(Nombre "Animacion"))

([tvornotv_Class20035] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Dan Castellaneta"))

([tvornotv_Class20036] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Nancy Cartwright"))

([tvornotv_Class20038] of  Serie

	(AnyoContenido 1999)
	(CActor
		[tvornotv_Class20039]
		[tvornotv_Class20040]
		[tvornotv_Class20041])
	(Capitulos 98)
	(CDirector [tvornotv_Class20033])
	(CGenero
		[tvornotv_Class10043]
		[tvornotv_Class10039]
		[tvornotv_Class10053]
		[tvornotv_Class20034])
	(ClasEdades 14)
	(CProductor [tvornotv_Class20016])
	(Duracion 30)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 6)
	(Titulo "Futurama"))

([tvornotv_Class20039] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Billy West"))

([tvornotv_Class20040] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "John Di Maggio"))

([tvornotv_Class20041] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Katey Sagal"))

([tvornotv_Class20045] of  Documental

	(AnyoContenido 1980)
	(CDirector [tvornotv_Class20046])
	(Duracion 60)
	(Idioma "ingles")
	(Tematica Ciencia)
	(Titulo "Cosmos"))

([tvornotv_Class20046] of  Director

	(Nacionalidad "USA")
	(NombreApellido "Carl Sagan"))

([tvornotv_Class20047] of  Documental

	(AnyoContenido 2007)
	(CDirector [tvornotv_Class20048])
	(Duracion 118)
	(Idioma "ingles")
	(Tematica Historia)
	(Titulo "Zeitgeist"))

([tvornotv_Class20048] of  Director

	(NombreApellido "Peter Joseph"))

([tvornotv_Class23] of  Actor

	(NombreApellido "Sean Connery"))

([tvornotv_Class24] of  Serie

	(AnyoContenido 2006)
	(CActor [tvornotv_Class25])
	(Capitulos 77)
	(CDirector [tvornotv_Class26])
	(ClasEdades 12)
	(Duracion 42)
	(Idioma "castellano")
	(Nacionalidad "Estados Unidos")
	(Temporadas 4)
	(Titulo "Heroes"))

([tvornotv_Class25] of  Actor

	(NombreApellido "Milo Ventimiglia"))

([tvornotv_Class26] of  Director

	(NombreApellido "Tim Kring"))

([tvornotv_Class3] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Richard Ayoade"))

([tvornotv_Class4] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Katherine Parkinson"))

([tvornotv_Class5] of  Director

	(NombreApellido "Graham Linehan"))

([tvornotv_Class6] of  Productor

	(NombreApellido "Ash Atalla"))

([tvornotv_Class7] of  Serie

	(AnyoContenido 2005)
	(CActor
		[tvornotv_Class10012]
		[tvornotv_Class10013]
		[tvornotv_Class10014])
	(Capitulos 81)
	(CDirector [tvornotv_Class10])
	(CGenero
		[tvornotv_Class10037]
		[tvornotv_Class10059]
		[tvornotv_Class10039])
	(ClasEdades 14)
	(CProductor
		[tvornotv_Class10015]
		[tvornotv_Class20016])
	(Duracion 42)
	(Nacionalidad "EEUU")
	(Temporadas 4)
	(Titulo "Prison Break"))

([tvornotv_Class9] of  Genero

	(Nombre "Romance"))
	
)
