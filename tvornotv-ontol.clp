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
([MAIN::tvornotv_Class0] of  Serie

	(AnyoContenido 2006)
	(CActor
		[MAIN::tvornotv_Class2]
		[MAIN::tvornotv_Class3]
		[MAIN::tvornotv_Class4])
	(Capitulos 24)
	(CDirector [MAIN::tvornotv_Class5])
	(CGenero [MAIN::tvornotv_Class10043])
	(CProductor [MAIN::tvornotv_Class6])
	(Duracion 23)
	(EnEmision FALSE)
	(Idioma "ingles")
	(Nacionalidad "Inglaterra")
	(Temporadas 4)
	(Titulo "The IT Crowd"))

([MAIN::tvornotv_Class10] of  Director

	(NombreApellido "Paul Scheuring"))

([MAIN::tvornotv_Class10012] of  Actor

	(NombreApellido "Dominic Purcell"))

([MAIN::tvornotv_Class10013] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Wentworth Miller"))

([MAIN::tvornotv_Class10014] of  Actor

	(Nacionalidad "Puerto Rico")
	(NombreApellido "Amaury Nolasco"))

([MAIN::tvornotv_Class10015] of  Productor

	(NombreApellido "Adelstein-Parouse Productions"))

([MAIN::tvornotv_Class10016] of  Pelicula

	(AnyoContenido 1973)
	(CActor
		[MAIN::tvornotv_Class13]
		[MAIN::tvornotv_Class10017])
	(CDirector [MAIN::tvornotv_Class12])
	(CGenero
		[MAIN::tvornotv_Class10039]
		[MAIN::tvornotv_Class10037])
	(ClasEdades 12)
	(CProductor
		[MAIN::tvornotv_Class10027]
		[MAIN::tvornotv_Class10028])
	(Duracion 118)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Titulo "El emperador del Norte"))

([MAIN::tvornotv_Class10017] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Ernest Borgnine"))

([MAIN::tvornotv_Class10018] of  Pelicula

	(AnyoContenido 1997)
	(CActor
		[MAIN::tvornotv_Class10020]
		[MAIN::tvornotv_Class10024]
		[MAIN::tvornotv_Class10025]
		[MAIN::tvornotv_Class10026])
	(CDirector [MAIN::tvornotv_Class10019])
	(CGenero [MAIN::tvornotv_Class10043])
	(ClasEdades 18)
	(CProductor
		[MAIN::tvornotv_Class10022]
		[MAIN::tvornotv_Class10023])
	(Duracion 120)
	(Idioma "castellano")
	(Nacionalidad "España")
	(Titulo "Airbag"))

([MAIN::tvornotv_Class10019] of  Director

	(Nacionalidad "Espana")
	(NombreApellido "Juanma Bajo"))

([MAIN::tvornotv_Class10020] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Karlos Arguinano"))

([MAIN::tvornotv_Class10022] of  Productor

	(NombreApellido "Adrian Lipp"))

([MAIN::tvornotv_Class10023] of  Productor

	(Nacionalidad "Espana")
	(NombreApellido "Inaki Burrutxaga"))

([MAIN::tvornotv_Class10024] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Pilar Bardem"))

([MAIN::tvornotv_Class10025] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Santiago Segura"))

([MAIN::tvornotv_Class10026] of  Actor

	(Nacionalidad "Espana")
	(NombreApellido "Carlos Faemino"))

([MAIN::tvornotv_Class10027] of  Productor

	(NombreApellido "Stanley Hough"))

([MAIN::tvornotv_Class10028] of  Productor

	(NombreApellido "Kenneth Hyman"))

([MAIN::tvornotv_Class10029] of  Pelicula

	(AnyoContenido 1987)
	(CActor
		[MAIN::tvornotv_Class10047]
		[MAIN::tvornotv_Class10048]
		[MAIN::tvornotv_Class10049]
		[MAIN::tvornotv_Class10050])
	(CDirector [MAIN::tvornotv_Class10045])
	(CGenero
		[MAIN::tvornotv_Class10034]
		[MAIN::tvornotv_Class10036]
		[MAIN::tvornotv_Class10043])
	(ClasEdades 7)
	(CProductor
		[MAIN::tvornotv_Class10044]
		[MAIN::tvornotv_Class10046])
	(Duracion 98)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Titulo "The Princess Bride"))

([MAIN::tvornotv_Class10030] of  Productor

	(NombreApellido "Raymond Anzarut"))

([MAIN::tvornotv_Class10034] of  Genero

	(Nombre "Aventuras"))

([MAIN::tvornotv_Class10036] of  Genero

	(Nombre "Fantasia"))

([MAIN::tvornotv_Class10037] of  Genero

	(Nombre "Accion"))

([MAIN::tvornotv_Class10038] of  Genero

	(Nombre "Belica"))

([MAIN::tvornotv_Class10039] of  Genero

	(Nombre "Drama"))

([MAIN::tvornotv_Class10040] of  Genero

	(Nombre "Espionaje"))

([MAIN::tvornotv_Class10041] of  Productor

	(Nacionalidad "EEUU")
	(NombreApellido "Albert Romolo Broccoli"))

([MAIN::tvornotv_Class10042] of  Productor

	(Nacionalidad "Canada")
	(NombreApellido "Harry Saltzman"))

([MAIN::tvornotv_Class10043] of  Genero

	(Nombre "Comedia"))

([MAIN::tvornotv_Class10044] of  Productor

	(NombreApellido "Andrew Scheiman"))

([MAIN::tvornotv_Class10045] of  Director

	(NombreApellido "Rob Reiner"))

([MAIN::tvornotv_Class10046] of  Productor

	(NombreApellido "Rob Reiner"))

([MAIN::tvornotv_Class10047] of  Actor

	(NombreApellido "Robin Wright"))

([MAIN::tvornotv_Class10048] of  Actor

	(NombreApellido "Cary Elwes"))

([MAIN::tvornotv_Class10049] of  Actor

	(NombreApellido "Mandy Patinkin"))

([MAIN::tvornotv_Class10050] of  Actor

	(NombreApellido "Chris Sarandon"))

([MAIN::tvornotv_Class10051] of  Serie

	(AnyoContenido 1963)
	(CActor
		[MAIN::tvornotv_Class10054]
		[MAIN::tvornotv_Class10055])
	(Capitulos 776)
	(CGenero
		[MAIN::tvornotv_Class10039]
		[MAIN::tvornotv_Class10053])
	(ClasEdades 0)
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "Inglaterra")
	(Temporadas 6)
	(Titulo "Dr. Who"))

([MAIN::tvornotv_Class10052] of  Director

	(NombreApellido "Tom Hanks"))

([MAIN::tvornotv_Class10053] of  Genero

	(Nombre "CienciaFiccion"))

([MAIN::tvornotv_Class10054] of  Actor

	(NombreApellido "Matt Smith"))

([MAIN::tvornotv_Class10055] of  Actor

	(NombreApellido "David Tennant"))

([MAIN::tvornotv_Class10056] of  Serie

	(AnyoContenido 2005)
	(CActor
		[MAIN::tvornotv_Class10049]
		[MAIN::tvornotv_Class10061]
		[MAIN::tvornotv_Class10062]
		[MAIN::tvornotv_Class10063])
	(Capitulos 138)
	(CDirector [MAIN::tvornotv_Class10057])
	(CGenero
		[MAIN::tvornotv_Class10058]
		[MAIN::tvornotv_Class10039]
		[MAIN::tvornotv_Class10059]
		[MAIN::tvornotv_Class10060])
	(ClasEdades 16)
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Temporadas 6)
	(Titulo "Mentes Criminales"))

([MAIN::tvornotv_Class10057] of  Director

	(NombreApellido "Jeff Davis"))

([MAIN::tvornotv_Class10058] of  Genero

	(Nombre "Policiaco"))

([MAIN::tvornotv_Class10059] of  Genero

	(Nombre "Criminologia"))

([MAIN::tvornotv_Class10060] of  Genero

	(Nombre "Forenses"))

([MAIN::tvornotv_Class10061] of  Actor

	(NombreApellido "Thomas Gibson"))

([MAIN::tvornotv_Class10062] of  Actor

	(NombreApellido "Shemar Moore"))

([MAIN::tvornotv_Class10063] of  Actor

	(NombreApellido "Matthew Grey Gubler"))

([MAIN::tvornotv_Class10064] of  Serie

	(AnyoContenido 2000)
	(CActor
		[MAIN::tvornotv_Class10065]
		[MAIN::tvornotv_Class10066]
		[MAIN::tvornotv_Class10067]
		[MAIN::tvornotv_Class10068])
	(CDirector [MAIN::tvornotv_Class10069])
	(ClasEdades 13)
	(CProductor [MAIN::tvornotv_Class10070])
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Temporadas 11)
	(Titulo "CSI: Las Vegas"))

([MAIN::tvornotv_Class10065] of  Actor

	(NombreApellido "Lawrence Fishburne"))

([MAIN::tvornotv_Class10066] of  Actor

	(NombreApellido "William Petersen"))

([MAIN::tvornotv_Class10067] of  Actor

	(NombreApellido "Marg Heigenberger"))

([MAIN::tvornotv_Class10068] of  Actor

	(NombreApellido "George Eads"))

([MAIN::tvornotv_Class10069] of  Director

	(NombreApellido "Anthony E. Zuiker"))

([MAIN::tvornotv_Class10070] of  Productor

	(NombreApellido "Jerry Bruckheimer"))

([MAIN::tvornotv_Class10071] of  Serie

	(AnyoContenido 2011)
	(CActor
		[MAIN::tvornotv_Class10076]
		[MAIN::tvornotv_Class10077]
		[MAIN::tvornotv_Class10078])
	(Capitulos 3)
	(CDirector
		[MAIN::tvornotv_Class10073]
		[MAIN::tvornotv_Class10074]
		[MAIN::tvornotv_Class10075])
	(CGenero [MAIN::tvornotv_Class10072])
	(ClasEdades 18)
	(CProductor [MAIN::tvornotv_Class10079])
	(Duracion 60)
	(EnEmision TRUE)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Temporadas 1)
	(Titulo "Juego de Tronos"))

([MAIN::tvornotv_Class10072] of  Genero

	(Nombre "Fantasia medieval"))

([MAIN::tvornotv_Class10073] of  Director

	(NombreApellido "David Benioff"))

([MAIN::tvornotv_Class10074] of  Director

	(NombreApellido "D. B. Weiss"))

([MAIN::tvornotv_Class10075] of  Director

	(NombreApellido "George R. R. Martin"))

([MAIN::tvornotv_Class10076] of  Actor

	(NombreApellido "Mark Addy"))

([MAIN::tvornotv_Class10077] of  Actor

	(NombreApellido "Afie Alien"))

([MAIN::tvornotv_Class10078] of  Actor

	(NombreApellido "Sean Bean"))

([MAIN::tvornotv_Class10079] of  Productor

	(NombreApellido "David Benioff"))

([MAIN::tvornotv_Class10080] of  Serie

	(AnyoContenido 2001)
	(CActor
		[MAIN::tvornotv_Class10084]
		[MAIN::tvornotv_Class10085]
		[MAIN::tvornotv_Class10086])
	(Capitulos 11)
	(CDirector
		[MAIN::tvornotv_Class10052]
		[MAIN::tvornotv_Class10083])
	(CGenero
		[MAIN::tvornotv_Class10037]
		[MAIN::tvornotv_Class10038])
	(ClasEdades 18)
	(CProductor
		[MAIN::tvornotv_Class10081]
		[MAIN::tvornotv_Class10082])
	(Duracion 60)
	(Idioma "ingles")
	(Nacionalidad
		"EEUU"
		"Reino Unido")
	(Temporadas 1)
	(Titulo "Band of Brothers"))

([MAIN::tvornotv_Class10081] of  Productor

	(NombreApellido "Steven Spielberg"))

([MAIN::tvornotv_Class10082] of  Productor

	(NombreApellido "Tom Hanks"))

([MAIN::tvornotv_Class10083] of  Director

	(NombreApellido "Mark Cowen"))

([MAIN::tvornotv_Class10084] of  Actor

	(NombreApellido "Ron Livingston"))

([MAIN::tvornotv_Class10085] of  Actor

	(NombreApellido "James McAvoy"))

([MAIN::tvornotv_Class10086] of  Actor

	(NombreApellido "Stephen Graham"))

([MAIN::tvornotv_Class11] of  Pelicula

	(AnyoContenido 1967)
	(CActor
		[MAIN::tvornotv_Class13]
		[MAIN::tvornotv_Class14]
		[MAIN::tvornotv_Class15])
	(CDirector [MAIN::tvornotv_Class12])
	(CGenero
		[MAIN::tvornotv_Class10037]
		[MAIN::tvornotv_Class10038])
	(ClasEdades 12)
	(CProductor
		[MAIN::tvornotv_Class10030]
		[MAIN::tvornotv_Class10028])
	(Duracion 145)
	(Idioma "castellano")
	(Nacionalidad "EEUU")
	(Titulo "Los doce del patibulo"))

([MAIN::tvornotv_Class12] of  Director

	(Nacionalidad "EEUU")
	(NombreApellido "Robert Aldrich"))

([MAIN::tvornotv_Class13] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Lee Marvin"))

([MAIN::tvornotv_Class14] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Charles Bronson"))

([MAIN::tvornotv_Class15] of  Actor

	(Nacionalidad "EEUU")
	(NombreApellido "Donald Sutherland"))

([MAIN::tvornotv_Class16] of  Documental

	(AnyoContenido 1985)
	(CDirector [MAIN::tvornotv_Class17])
	(ClasEdades 0)
	(Duracion 60)
	(Idioma "castellano")
	(Nacionalidad "España")
	(Tematica Naturaleza)
	(Titulo "El lince ibérico"))

([MAIN::tvornotv_Class17] of  Director

	(NombreApellido "Felix Rodriguez de la Fuente"))

([MAIN::tvornotv_Class18] of  Pelicula

	(AnyoContenido 1962)
	(CActor [MAIN::tvornotv_Class23])
	(CDirector [MAIN::tvornotv_Class19])
	(CGenero
		[MAIN::tvornotv_Class10037]
		[MAIN::tvornotv_Class10040])
	(ClasEdades 7)
	(Color_BN TRUE)
	(CProductor
		[MAIN::tvornotv_Class10041]
		[MAIN::tvornotv_Class10042])
	(Duracion 110)
	(Idioma "ingles")
	(Nacionalidad "Inglaterra")
	(Titulo "Dr. No"))

([MAIN::tvornotv_Class19] of  Director

	(NombreApellido "Terence Young"))

([MAIN::tvornotv_Class2] of  Actor

	(Nacionalidad "Irlanda")
	(NombreApellido "Chris O'Dowd"))

([MAIN::tvornotv_Class20016] of  Productor

	(NombreApellido "20th Century Fox Television"))

([MAIN::tvornotv_Class20017] of  Serie

	(AnyoContenido 2010)
	(CActor
		[MAIN::tvornotv_Class20020]
		[MAIN::tvornotv_Class20021]
		[MAIN::tvornotv_Class20022])
	(Capitulos 19)
	(CDirector [MAIN::tvornotv_Class20018])
	(CGenero
		[MAIN::tvornotv_Class20019]
		[MAIN::tvornotv_Class10039]
		[MAIN::tvornotv_Class10053])
	(ClasEdades 14)
	(CProductor [MAIN::tvornotv_Class20023])
	(Duracion 60)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 2)
	(Titulo "The Walking Dead"))

([MAIN::tvornotv_Class20018] of  Director

	(Nacionalidad "Francia")
	(NombreApellido "Frank Darabont"))

([MAIN::tvornotv_Class20019] of  Genero

	(Nombre "Terror"))

([MAIN::tvornotv_Class20020] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Andrew Lincoln"))

([MAIN::tvornotv_Class20021] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Jon Bernthal"))

([MAIN::tvornotv_Class20022] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Sarah Wayne Callies"))

([MAIN::tvornotv_Class20023] of  Productor

	(Nacionalidad "Francia")
	(NombreApellido "Frank Darabont"))

([MAIN::tvornotv_Class20024] of  Serie

	(AnyoContenido 1994)
	(CActor
		[MAIN::tvornotv_Class20029]
		[MAIN::tvornotv_Class20030]
		[MAIN::tvornotv_Class20031])
	(Capitulos 238)
	(CDirector
		[MAIN::tvornotv_Class20025]
		[MAIN::tvornotv_Class20027])
	(CGenero
		[MAIN::tvornotv_Class10043]
		[MAIN::tvornotv_Class9])
	(ClasEdades 14)
	(CProductor
		[MAIN::tvornotv_Class20026]
		[MAIN::tvornotv_Class20028])
	(Duracion 22)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 10)
	(Titulo "Friends"))

([MAIN::tvornotv_Class20025] of  Director

	(Nacionalidad "USA")
	(NombreApellido "David Crane"))

([MAIN::tvornotv_Class20026] of  Productor

	(NombreApellido "Marta Kauffman"))

([MAIN::tvornotv_Class20027] of  Director

	(NombreApellido "Marta Kauffman"))

([MAIN::tvornotv_Class20028] of  Productor

	(Nacionalidad "USA")
	(NombreApellido "David Crane"))

([MAIN::tvornotv_Class20029] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Jennifer Aniston"))

([MAIN::tvornotv_Class20030] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Courteney Cox"))

([MAIN::tvornotv_Class20031] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Lisa Kudrow"))

([MAIN::tvornotv_Class20032] of  Serie

	(AnyoContenido 1989)
	(CActor
		[MAIN::tvornotv_Class20035]
		[MAIN::tvornotv_Class20036])
	(Capitulos 486)
	(CDirector [MAIN::tvornotv_Class20033])
	(CGenero
		[MAIN::tvornotv_Class10043]
		[MAIN::tvornotv_Class20034])
	(CProductor [MAIN::tvornotv_Class20016])
	(Duracion 22)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 22)
	(Titulo "The Simpsons"))

([MAIN::tvornotv_Class20033] of  Director

	(Nacionalidad "USA")
	(NombreApellido "Matt Groening"))

([MAIN::tvornotv_Class20034] of  Genero

	(Nombre "Animacion"))

([MAIN::tvornotv_Class20035] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Dan Castellaneta"))

([MAIN::tvornotv_Class20036] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Nancy Cartwright"))

([MAIN::tvornotv_Class20038] of  Serie

	(AnyoContenido 1999)
	(CActor
		[MAIN::tvornotv_Class20039]
		[MAIN::tvornotv_Class20040]
		[MAIN::tvornotv_Class20041])
	(Capitulos 98)
	(CDirector [MAIN::tvornotv_Class20033])
	(CGenero
		[MAIN::tvornotv_Class10043]
		[MAIN::tvornotv_Class10039]
		[MAIN::tvornotv_Class10053]
		[MAIN::tvornotv_Class20034])
	(ClasEdades 14)
	(CProductor [MAIN::tvornotv_Class20016])
	(Duracion 30)
	(EnEmision TRUE)
	(Idioma "ingles")
	(Nacionalidad "EEUU")
	(Temporadas 6)
	(Titulo "Futurama"))

([MAIN::tvornotv_Class20039] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Billy West"))

([MAIN::tvornotv_Class20040] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "John Di Maggio"))

([MAIN::tvornotv_Class20041] of  Actor

	(Nacionalidad "USA")
	(NombreApellido "Katey Sagal"))

([MAIN::tvornotv_Class20045] of  Documental

	(AnyoContenido 1980)
	(CDirector [MAIN::tvornotv_Class20046])
	(Duracion 60)
	(Idioma "ingles")
	(Tematica Ciencia)
	(Titulo "Cosmos"))

([MAIN::tvornotv_Class20046] of  Director

	(Nacionalidad "USA")
	(NombreApellido "Carl Sagan"))

([MAIN::tvornotv_Class20047] of  Documental

	(AnyoContenido 2007)
	(CDirector [MAIN::tvornotv_Class20048])
	(Duracion 118)
	(Idioma "ingles")
	(Tematica Historia)
	(Titulo "Zeitgeist"))

([MAIN::tvornotv_Class20048] of  Director

	(NombreApellido "Peter Joseph"))

([MAIN::tvornotv_Class23] of  Actor

	(NombreApellido "Sean Connery"))

([MAIN::tvornotv_Class24] of  Serie

	(AnyoContenido 2006)
	(CActor [MAIN::tvornotv_Class25])
	(Capitulos 77)
	(CDirector [MAIN::tvornotv_Class26])
	(ClasEdades 12)
	(Duracion 42)
	(Idioma "castellano")
	(Nacionalidad "Estados Unidos")
	(Temporadas 4)
	(Titulo "Heroes"))

([MAIN::tvornotv_Class25] of  Actor

	(NombreApellido "Milo Ventimiglia"))

([MAIN::tvornotv_Class26] of  Director

	(NombreApellido "Tim Kring"))

([MAIN::tvornotv_Class3] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Richard Ayoade"))

([MAIN::tvornotv_Class4] of  Actor

	(Nacionalidad "Inglaterra")
	(NombreApellido "Katherine Parkinson"))

([MAIN::tvornotv_Class5] of  Director

	(NombreApellido "Graham Linehan"))

([MAIN::tvornotv_Class6] of  Productor

	(NombreApellido "Ash Atalla"))

([MAIN::tvornotv_Class7] of  Serie

	(AnyoContenido 2005)
	(CActor
		[MAIN::tvornotv_Class10012]
		[MAIN::tvornotv_Class10013]
		[MAIN::tvornotv_Class10014])
	(Capitulos 81)
	(CDirector [MAIN::tvornotv_Class10])
	(CGenero
		[MAIN::tvornotv_Class10037]
		[MAIN::tvornotv_Class10059]
		[MAIN::tvornotv_Class10039])
	(ClasEdades 14)
	(CProductor
		[MAIN::tvornotv_Class10015]
		[MAIN::tvornotv_Class20016])
	(Duracion 42)
	(Nacionalidad "EEUU")
	(Temporadas 4)
	(Titulo "Prison Break"))

([MAIN::tvornotv_Class9] of  Genero

	(Nombre "Romance"))
	
)
