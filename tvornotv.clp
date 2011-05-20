; Fri May 13 18:47:04 CEST 2011
; 
;+ (version "3.4.5")
;+ (build "Build 608")

([tvornotv_Class16] of  Documental

	(AnyoContenido 1985)
	(CDirector [tvornotv_Class17])
	(ClasEdades todos-publicos)
	(Duracion 60)
	(Idioma "Español")
	(Nacionalidad "España")
	(Tematica Naturaleza)
	(Titulo "El lince ibérico"))

([tvornotv_Class17] of  Director

	(NombreApellido "Felix Rodríguez de la Fuente"))

([tvornotv_Class18] of  Pelicula

	(AnyoContenido 1962)
	(CActor [tvornotv_Class23])
	(CDirector [tvornotv_Class19])
	(ClasEdades mayores-13)
	(Color_BN TRUE)
	(Duracion 110)
	(Genero Accion)
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
	(Genero Drama Ciencia-Ficcion)
	(Idioma "Español")
	(Nacionalidad "Estados Unidos")
	(Temporadas 4)
	(Titulo "Heroes"))

([tvornotv_Class25] of  Actor

	(NombreApellido "Milo Ventimiglia"))

([tvornotv_Class26] of  Director

	(NombreApellido "Tim Kring"))

(defclass %3ACLIPS_TOP_LEVEL_SLOT_CLASS "Fake class to save top-level slot information"
	(is-a USER)
	(role abstract)
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
	(single-slot Color_BN
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot NombreApellido
		(type STRING)
;+		(cardinality 0 1)
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
	(multislot Genero
		(type SYMBOL)
		(allowed-values Accion Animacion Ciencia-Ficcion Drama Comedia Thriller Rom%C3%A1ntica Militar)
		(cardinality 1 5)
		(create-accessor read-write))
	(single-slot EnEmision
		(type SYMBOL)
		(allowed-values FALSE TRUE)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(single-slot Nacionalidad
		(type STRING)
;+		(cardinality 0 1)
		(create-accessor read-write)))

(defclass ProgramaTv
	(is-a USER)
	(role abstract)
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
	(single-slot Nacionalidad
		(type STRING)
;+		(cardinality 1 1)
		(create-accessor read-write)))

(defclass Pelicula
	(is-a ProgramaTv)
	(role concrete)
	(multislot Genero
		(type SYMBOL)
		(allowed-values Accion Animacion Ciencia-Ficcion Drama Comedia Thriller Rom%C3%A1ntica Militar)
		(cardinality 1 5)
		(create-accessor read-write))
	(multislot CActor
		(type INSTANCE)
;+		(allowed-classes Actor)
		(create-accessor read-write)))

(defclass Serie
	(is-a ProgramaTv)
	(role concrete)
	(single-slot Temporadas
		(type INTEGER)
;+		(cardinality 0 1)
		(create-accessor read-write))
	(multislot Genero
		(type SYMBOL)
		(allowed-values Accion Animacion Ciencia-Ficcion Drama Comedia Thriller Rom%C3%A1ntica Militar)
		(cardinality 1 5)
		(create-accessor read-write))
	(multislot CActor
		(type INSTANCE)
;+		(allowed-classes Actor)
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
	(single-slot Nacionalidad
		(type STRING)
;+		(cardinality 0 1)
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

(deffunction pregunta (?pregunta $?valores-permitidos)
	(progn$ (?var ?valores-permitidos) (lowcase ?var))
	(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
	(bind ?respuesta (read))
	(while (not (member (upcase ?respuesta) ?valores-permitidos)) do
		(format t "¿%s? (%s) " ?pregunta (implode$ ?valores-permitidos))
		(bind ?respuesta (read))
	)
	?respuesta
)
   
(deffunction pregunta-numerica (?pregunta ?rangini ?rangfi)
	(format t "¿%s? [%d, %d] " ?pregunta ?rangini ?rangfi)
	(bind ?respuesta (read))
	(while (not(and(> ?respuesta ?rangini)(< ?respuesta ?rangfi))) do
		(format t "¿%s? [%d, %d] " ?pregunta ?rangini ?rangfi)
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

;;; Modulo de preguntas inicial sobre el usuario

(defmodule preguntas-generales "Modulo de preguntas generales"
	(import MAIN ?ALL)
	(import inicializacion ?ALL)
	(export ?ALL)
)

(defrule preguntar-edad
	(not(edad))=>
		(bind ?edad (pregunta-numerica "Qué edad tienes" 0 150))
)

(defrule preguntar-sexe
(not(sexe ))=> 
(bind ?sexe
 (pregunta "De que sexo eres?" hombre mujer)
) 
)

(defrule preguntar-pais
(not(pais))=> 
(bind ?pais
 (pregunta-general "De nacionalidad eres?" )
) 
)

(defrule preguntar-idoma
(not(idiomes))=> 
(bind ?idiomes
 (pegunta "Que idomas habals?" Castellano Catalan Francés Inglés Aleman Italina Japonés )
) 
)


(defrule preguntar-actor
(not(actor-pref))=> 
(bind ?actor-pref
 (pregunta-general "Qual es tu actor preferido?")
) 
)

(defrule preguntar-director
(not(director-pref))=> 
(bind ?director-pref
 (pregunta-general "Qual es tu actor preferido?")
) 
)

(defrule preguntar-detestat
(not(genere-det))=> 
(bind ?genere-det
 (preguntar "Que genero detestas?" Western Acción Policiaca Intriga Ciencia-ficción Comedia Romántica Bélica)
) 
)



;;; Modulo de preguntas por descriptor de contenido
