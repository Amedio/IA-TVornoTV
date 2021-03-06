; Fri May 13 18:47:04 CEST 2011
; 
;+ (version "3.4.5")
;+ (build "Build 608")

(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role concrete)
	(single-slot ClasEdades
		(type SYMBOL)
		(allowed-values mayores-7 mayores-13 mayores-18 todos-publicos)
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
	(single-slot Titulo
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Capitulos
		(type INTEGER)
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
	(single-slot NombreApellido
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot CProductor
		(type INSTANCE)
;+		(allowed-classes Productor)
		(create-accessor read-write))
	(single-slot Tematica
		(type SYMBOL)
		(allowed-values Naturaleza Ciencia Actualidad Historia Arte Politica Economia)
;+		(cardinality 0 1)
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
		(type SYMBOL)
		(allowed-values mayores-7 mayores-13 mayores-18 todos-publicos)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot PorcentajeHombres
		(type FLOAT)
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
	(single-slot Color_BN
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot AnyoContenido
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Idioma
		(type STRING)
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
	(multislot CProductor
		(type INSTANCE)
;+		(allowed-classes Productor)
		(create-accessor read-write))
	(single-slot Capitulos
		(type INTEGER)
;+		(cardinality 0 1)
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
	(role abstract)
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
([tvornotv_Class10016] of  Pelicula

	(AnyoContenido 1973)
	(CActor
		[tvornotv_Class13]
		[tvornotv_Class10017])
	(CDirector [tvornotv_Class12])
	(CGenero
		[tvornotv_Class10039]
		[tvornotv_Class10037])
	(ClasEdades todos-publicos)
	(CProductor
		[tvornotv_Class10027]
		[tvornotv_Class10028])
	(Duracion 118)
	(Idioma "EspaÃ±ol")
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
	(ClasEdades mayores-18)
	(CProductor
		[tvornotv_Class10022]
		[tvornotv_Class10023])
	(Duracion 120)
	(Idioma "EspaÃ±ol")
	(Nacionalidad "EspaÃ±a")
	(Titulo "Airbag"))

([tvornotv_Class10019] of  Director

	(Nacionalidad "EspaÃ±a")
	(NombreApellido "Juanma Bajo"))

([tvornotv_Class10020] of  Actor

	(Nacionalidad "EspaÃ±a")
	(NombreApellido "Karlos ArguiÃ±ano"))

([tvornotv_Class10022] of  Productor

	(NombreApellido "Adrian Lipp"))

([tvornotv_Class10023] of  Productor

	(Nacionalidad "EspaÃ±a")
	(NombreApellido "IÃ±aki Burrutxaga"))

([tvornotv_Class10024] of  Actor

	(Nacionalidad "EspaÃ±a")
	(NombreApellido "Pilar Bardem"))

([tvornotv_Class10025] of  Actor

	(Nacionalidad "EspaÃ±a")
	(NombreApellido "Santiago Segura"))

([tvornotv_Class10026] of  Actor

	(Nacionalidad "EspaÃ±a")
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
	(ClasEdades todos-publicos)
	(CProductor
		[tvornotv_Class10044]
		[tvornotv_Class10046])
	(Duracion 98)
	(Idioma "Ingles")
	(Nacionalidad "EEUU")
	(Titulo "The Princess Bride"))

([tvornotv_Class10030] of  Productor

	(NombreApellido "Raymond Anzarut"))

([tvornotv_Class10034] of  Genero

	(Nombre "Aventuras"))

([tvornotv_Class10036] of  Genero

	(Nombre "Fantasia"))

([tvornotv_Class10037] of  Genero

	(Nombre "AcciÃ³n"))

([tvornotv_Class10038] of  Genero

	(Nombre "BÃ©lica"))

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
	(ClasEdades todos-publicos)
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "Ingles")
	(Nacionalidad "Inglaterra")
	(Temporadas 6)
	(Titulo "Dr. Who"))

([tvornotv_Class10052] of  Director

	(NombreApellido "Tom Hanks"))

([tvornotv_Class10053] of  Genero

	(Nombre "Ciencia-Ficcion"))

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
	(ClasEdades mayores-13)
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "EspaÃ±ol")
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
	(ClasEdades mayores-13)
	(CProductor [tvornotv_Class10070])
	(Duracion 45)
	(EnEmision TRUE)
	(Idioma "EspaÃ±ol")
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
	(ClasEdades mayores-18)
	(CProductor [tvornotv_Class10079])
	(Duracion 60)
	(EnEmision TRUE)
	(Idioma "EspaÃ±ol")
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
	(ClasEdades mayores-18)
	(CProductor
		[tvornotv_Class10081]
		[tvornotv_Class10082])
	(Duracion 60)
	(Idioma "Ingles")
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
	(CProductor
		[tvornotv_Class10030]
		[tvornotv_Class10028])
	(Duracion 145)
	(Idioma "EspaÃ±ol")
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
	(ClasEdades todos-publicos)
	(Duracion 60)
	(Idioma "EspaÃ±ol")
	(Nacionalidad "EspaÃ±a")
	(Tematica Naturaleza)
	(Titulo "El lince ibÃ©rico"))

([tvornotv_Class17] of  Director

	(NombreApellido "Felix RodrÃ­guez de la Fuente"))

([tvornotv_Class18] of  Pelicula

	(AnyoContenido 1962)
	(CActor [tvornotv_Class23])
	(CDirector [tvornotv_Class19])
	(CGenero
		[tvornotv_Class10037]
		[tvornotv_Class10040])
	(ClasEdades mayores-13)
	(Color_BN TRUE)
	(CProductor
		[tvornotv_Class10041]
		[tvornotv_Class10042])
	(Duracion 110)
	(Idioma "Ingles")
	(Nacionalidad "Inglaterra")
	(Titulo "Dr. No"))

([tvornotv_Class19] of  Director

	(NombreApellido "Terence Young"))

([tvornotv_Class23] of  Actor

	(NombreApellido "Sean Connery"))

([tvornotv_Class24] of  Serie

	(AnyoContenido 2006)
	(CActor [tvornotv_Class25])
	(Capitulos 77)
	(CDirector [tvornotv_Class26])
	(ClasEdades mayores-13)
	(Duracion 42)
	(Idioma "EspaÃ±ol")
	(Nacionalidad "Estados Unidos")
	(Temporadas 4)
	(Titulo "Heroes"))

([tvornotv_Class25] of  Actor

	(NombreApellido "Milo Ventimiglia"))

([tvornotv_Class26] of  Director

	(NombreApellido "Tim Kring"))

)


;;; ---------------------------------------------------------------------------------------------------------------------
;;; // ---------------------------------------------- ENGINE --------------------------------------------------------- //
;;; ---------------------------------------------------------------------------------------------------------------------

(defmodule MAIN (export ?ALL))

;;; --------------
;;; ---TEMPLATE---
;;; --------------

(deftemplate recomendacion "Recomendacion resultante del sistema experto"
	(slot persona)
	(multislot programastv)
	(slot final?)
)


;;; ------------------
;;; ----FUNCIONES-----
;;; ------------------

(deffunction pregunta (?pregunta $?valores-permitidos)
	(progn$ (?var ?valores-permitidos) (lowcase ?var))
	(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
	(bind ?respuesta (read))
	(while (not (member (lowcase ?respuesta) ?valores-permitidos)) do
		(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
		(bind ?respuesta (read))
	)
	?respuesta
)
   
(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "¿%s? [MAIN::%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(> ?respuesta ?rangini)(< ?respuesta ?rangfi))) do
		(format t "¿%s? [MAIN::%d, %d] " ?pregunta ?rangini ?rangfi)
		(bind ?respuesta (read))
	)
	?respuesta
)

(deffunction pregunta-general (?pregunta)
	(format t "¿%s? " ?pregunta)
	(bind ?respuesta (read))
	?respuesta
)

(deffunction si-o-no-p (?pregunta)
	(bind ?respuesta (pregunta ?pregunta SI NO S N))
	(if (or (eq (lowcase ?respuesta) si) (eq (lowcase ?respuesta) s))
		then TRUE 
		else FALSE
	)
)

;;; ----------------
;;; -----REGLAS-----
;;; ----------------

;;; Presentacion

(defrule rotulo-inicial
	(declare (salience 10))
	=>
	(printout t "-----------------------------------------------------" crlf)
  (printout t "------ Sistema Experto de de programas deOrnoTV -----" crlf)
  (printout t "-----------------------------------------------------" crlf)
  (printout t crlf)
  (focus preguntas-generales)
)

;;;(defrule su-recomendacion-es
  ;;;(declare (salience 10))
  ;;;?rec <- (recomendacion (persona ?per) (final? ok) (habitaciones $?lista-hab))
  ;;;=>
	;;;(modify ?rec (final? imprimir))
	;;;(focus impresion)
;;;)

;;; Modulo de preguntas inicial sobre el usuario

(defmodule preguntas-generales "Modulo de preguntas generales"
	(import MAIN ?ALL)
	(export ?ALL)
)

(defrule preguntar-edad
	(not (object (is-a Usuario)))=>
		(bind ?edad (pregunta-numerica "Que edad tienes" 0 150))
		(bind ?user (make-instance usuario of Usuario))
		(send ?user put-Edad ?edad)
		(assert (recomendacion (persona ?user)))
		(assert (Usuario Edad ok))
)

(defrule preguntar-sexe
  (not(Usuario Sexo ?))
  ?user <- (object (is-a Usuario))=> 
    (bind ?sexo (pregunta "De que sexo eres" hombre mujer)) 
    (send ?user put-Sexo ?sexo)
    (assert (Persona sexo ok))
)

(defrule preguntar-pais
  (not (Usuario Nacionalidad ?))
  ?user <- (object (is-a Usuario))=> 
    (bind ?pais (pregunta-general "De que nacionalidad eres" ))
    (send ?user put-Nacionalidad (create$ ?pais))
    (assert (Persona Nacionalidad ok))
)

(defrule preguntar-idioma
  (not (Usuario Idiomas ?))
  ?user <- (object (is-a Usuario))=> 
    (bind ?idioma (pregunta "Que idiomas hablas" castellano catalan frances ingles aleman italiano japones))
    (while (not (eq ?idioma fin)) do
      (slot-insert$ ?user Idiomas 1 ?idioma)
      (bind ?idioma (pregunta "Que idiomas hablas" castellano catalan frances ingles aleman italiano japones fin))
    )
)

(defrule preguntar-actor
  (not (Usuario ActorFav ?))
  ?user <- (object (is-a Usuario))=> 
    (bind ?actor-pref (pregunta-general "Qual es tu actor preferido")) 
    (send ?user put-ActorFav ?actor-pref);
    (assert (Persona ActorFav ok))
)

(defrule preguntar-director
  (not (Usuario DirectorFav ?))
  ?user <- (object (is-a Usuario))=> 
    (bind ?director-pref (pregunta-general "Qual es tu director preferido")) 
    (send ?user put-DirectorFav ?director-pref);
    (assert (Persona DirectorFav ok))
)

(defrule preguntar-detestado
(not(genero-det))=>
(bind ?generos (find-all-instances ((?inst Genero)) TRUE))
(bind ?generos-loc (create$ ))
(loop-for-count (?i 1 (length$ ?generos))  do
  (insert$ ?generos-loc 1  send((nth$ ?i ?generos) get-Nombre))
)
(bind ?genero-det(pregunta "Que genero detestas" ?generos-loc)) 
(focus deduccion)
)



;;; Modulo de deduccion

(defmodule deduccion "Modulo de deduccion"
	(import MAIN ?ALL)
	(import preguntas-generales ?ALL)
	(export ?ALL)
)

(defrule carrega-peliculas
	?var <- (object (is-a Pelicula) (Idioma ?id) (ClasEdades ?edad-prog) (CGenero ?genero))
	?progs <- (recomendacion (programastv ?progstv))
	;;;(test (> ?edad ?edad-prog))
	(test (not (eq (member$ ?id ?idiomas) FALSE)))
	(test (eq (member$ ?genere-det ?genero) FALSE)) =>
	(insert$ ?progs 1 ?var)
)