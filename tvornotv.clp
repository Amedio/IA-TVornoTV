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
		(assert (recomendacion (persona ?user) (final? FALSE)))
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
    (bind ?idioma (pregunta "Que idiomas hablas" "castellano" "catalan" "frances" "ingles" "aleman" "italiano" "japones"))
    (while (not (eq ?idioma fin)) do
      (slot-insert$ ?user Idiomas 1 ?idioma)
      (bind ?idioma (pregunta "Que idiomas hablas" "castellano" "catalan" "frances" "ingles" "aleman" "italiano" "japones" fin))
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
  ?rec <- (recomendacion (persona ?pers) (programastv $?progs))
  =>
    ;(printout t (length$ ?progs) crlf)
   (if (eq (length$ ?progs) 0) then
      (bind ?id (send ?pers get-Idiomas))
	(bind ?gen (send ?pers get-GeneroDetestado))
	(bind ?edad (send ?pers get-Edad))
	 
      (bind ?var (find-all-instances ((?inst Pelicula)) (and(not (eq (  member$ ?inst:Idioma ?id ) FALSE))  (eq ( member$ ?gen ?inst:CGenero ) FALSE)(< ?inst:ClasEdades ?edad) ) ))
(bind ?var2 (find-all-instances ((?inst2 Serie)) (and (not (eq (  member$ ?inst2:Idioma ?id ) FALSE)) (eq ( member$ ?gen ?inst2:CGenero ) FALSE) (< ?inst2:ClasEdades ?edad) ) ))
(bind ?var (insert$ ?var 1 ?var2))
(bind ?var3 (find-all-instances ((?inst2 Documental)) (and (not (eq (  member$ ?inst2:Idioma ?id ) FALSE)) (< ?inst2:ClasEdades ?edad) ) ))
(bind ?var (insert$ ?var 1 ?var3))
	(printout t (length$ ?var) crlf)
	(printout t (length$ ?var2) crlf)
      (modify ?rec (programastv ?var))
      ;(assert (recomendacion programastv ok))
    )
)

(defrule puntuacion-ini
	?rec <- (recomendacion (persona ?pers) (programastv $?progs) (final? FALSE))
	=>
	(bind ?i 1)
	(while (<= ?i (length$ $progs)) do 

		(if (and (< (send ?pers get-Edad) (+ (send(nth$ ?i  ?progs) get-ClasEdades) 5) )  ( > (send ?pers get-Edad) (- (send(nth$ ?i  ?progs) get-ClasEdades) 5) ) ) then

			(bind ?aux(+ (send (nth$ ?i ?progs) get-Puntuacion) 1))
			(send (nth$ ?i ?progs) put-Puntuacion ?aux)
   			 (assert (ProgramaTv Puntuacion ok))
		) 
		(if (and (eq (str-compare(send ?pers get-Sexo) hombre) 0 ) (> (send(nth$ ?i ?progs ) get-PorcentajeHombres) 0.5 ) )  then

			(bind ?aux(+ (send (nth$ ?i ?progs) get-Puntuacion) 1))
			(send (nth$ ?i ?progs) put-Puntuacion ?aux)
   			 (assert (ProgramaTv Puntuacion ok))
		)
		(if (and (eq (str-compare(send ?pers get-Sexo) mujer) 0 ) (> (send(nth$ ?i ?progs ) get-PorcentajeMujeres) 0.5 ) ) then

			(bind ?aux(+ (send (nth$ ?i ?progs) get-Puntuacion) 1))
			(send(nth$ ?i ?progs) put-Puntuacion ?aux)
   			 (assert (ProgramaTv Puntuacion ok))
		)
    
		(if (or (eq (class (nth$ ?i ?progs)) Serie) (eq (class (nth$ ?i ?progs)) Pelicula)) then
			(bind ?actores (create$ ))
			(bind ?actoresAux (send (nth$ ?i ?progs) get-CActor))
			(loop-for-count (?j 1 (length$ ?actoresAux)) do
				(bind ?aux (nth$ ?j ?actoresAux))
				(bind ?act-nombre (send ?aux get-NombreApellido))
				(bind ?actores (create$ ?actores ?act-nombre))
			)
			;(printout t ?actores crlf)
			(if (not (eq  (member$ (send ?pers get-ActorFav) ?actores ) FALSE)) then
				(bind ?aux(+ (send (nth$ ?i ?progs) get-Puntuacion) 1))
				(send(nth$ ?i ?progs) put-Puntuacion ?aux)
				(assert (ProgramaTv Puntuacion ok))
			)
		)

		(bind ?directores (create$ ))
		(bind ?directoresAux (send (nth$ ?i ?progs) get-CDirector))
		(loop-for-count (?j 1 (length$ ?directoresAux)) do
			(bind ?aux (nth$ ?j ?directoresAux))
			(bind ?dir-nombre (send ?aux get-NombreApellido))
			(bind ?directores (create$ ?directores ?dir-nombre))
		)
		;(printout t ?directores crlf)
		(if (not (eq  (member$ (send ?pers get-DirectorFav) ?directores ) FALSE)) then
			(bind ?aux(+ (send (nth$ ?i ?progs) get-Puntuacion) 1))
			(send(nth$ ?i ?progs) put-Puntuacion ?aux)
			(assert (ProgramaTv Puntuacion ok))
		)
		
		(bind ?i (+ ?i 1))
	)
	
	(bind ?new-progs (create$ ))
	(loop-for-count (?j 1 (length$ ?progs)) do
		
		(bind ?inserted 0)
		(loop-for-count (?z 1 (length$ ?new-progs)) do
				(if (and (eq ?inserted 0) (<= (send (nth$ ?j ?progs) get-Puntuacion) (send (nth$ ?z ?new-progs) get-Puntuacion))) then
					(bind ?new-progs (insert$ ?new-progs ?z (nth$ ?j ?progs)))
					(bind ?inserted 1)
				)
		)
		(if (eq ?inserted 0) then
			(bind ?new-progs (insert$ ?new-progs (+ (length$ ?new-progs) 1) (nth$ ?j ?progs)))
			(printout t "insertado" crlf)
		)
	)
	
    (modify ?rec (programastv ?new-progs))
	(modify ?rec (final? TRUE))
	(focus mostrar)
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