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
	(while (not (member  ?respuesta ?valores-permitidos)) do
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
    (bind ?idioma (pregunta "Que idiomas hablas" Castellano Catalan Frances Ingles Aleman Italiano Japones))
    (while (not (eq ?idioma fin)) do
      (slot-insert$ ?user Idiomas 1 ?idioma)
      (bind ?idioma (pregunta "Que idiomas hablas" Castellano Catalan Frances Ingles Aleman Italiano Japones fin))
    )
)

(defrule preguntar-actor
  (not (Usuario ActorFav ?))
  ?user <- (object (is-a Usuario))=> 
    (bind ?actor-pref (pregunta-general "Cual es tu actor preferido")) 
    (send ?user put-ActorFav ?actor-pref)
    (assert (Persona ActorFav ok))
)

(defrule preguntar-director
  (not (Usuario DirectorFav ?))
  ?user <- (object (is-a Usuario))=> 
    (bind ?director-pref (pregunta-general "Cual es tu director preferido")) 
    (send ?user put-DirectorFav ?director-pref)
    (assert (Persona DirectorFav ok))
)

(defrule preguntar-detestado
  (not (Usuario GeneroDetestado ?))
  ?user <- (object (is-a Usuario))=>
    (bind ?generos (create$ ))
    (do-for-all-instances ((?inst Genero)) TRUE
      (bind ?gen-nombre (send ?inst get-Nombre))
      (bind ?generos (create$ ?generos (lowcase ?gen-nombre)))
    )
    (bind ?genero-det(pregunta "Que genero detestas" ?generos)) 
    (send ?user put-GeneroDetestado ?genero-det)
    (assert (Persona GeneroDetestado ok))
    (focus deduccion)
)


;;; Modulo de deduccion

(defmodule deduccion "Modulo de deduccion"
	(import MAIN ?ALL)
	(import preguntas-generales ?ALL)
	(export ?ALL)
)

(defrule carrega-peliculas
       ?rec <- (recomendacion (persona ?pers))
	

       ;?var <- (object (is-a Pelicula) (Idioma ?id) (ClasEdades ?edad-prog) (CGenero ?genero))
       ;(test (member$ (str-cat ?id) (send ?pers get-Idiomas)))
       ;(test (eq (member$ (send ?aux get-GeneroDetestado) ?genero) FALSE))

       =>
(bind ?id (send ?pers get-Idiomas)) 
(bind ?var (find-all-instances ((?inst Pelicula)) (not (eq ( member$ ?inst:Idioma ?id) FALSE))  )) 
	;(bind ?var (find-all-instances ((?inst Pelicula)) (= 1 1)  )) 
       (printout t ?var)
       ;(modify ?rec (programastv ?var))
       ;(assert (recomendacion programastv ok))

)
;;;Modulo mostrar
(defmodule mostrar "Imprimir resultado"
	(import MAIN ?ALL)
	(import preguntas-generales ?ALL)
	(import deduccion ?ALL)
	(export ?ALL)
)

(defrule escriure

	?rec <- (recomendacion (programastv ?progs))=>
	(printout t ?rec)
	

)
