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
	(slot preferit)
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
     	 (modify ?rec (programastv ?var))
    )
)

(defrule puntuacion-ini
	?rec <- (recomendacion (persona ?pers) (programastv $?progs) (final? FALSE) )
	(not (send ?rec get-preferit))
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
		(if (not (eq  (member$ (send ?pers get-DirectorFav) ?directores ) FALSE)) then
			(bind ?aux(+ (send (nth$ ?i ?progs) get-Puntuacion) 1))
			(send(nth$ ?i ?progs) put-Puntuacion ?aux)
			(assert (ProgramaTv Puntuacion ok))
		)
		
		(bind ?i (+ ?i 1))
	)
	
	
	
    ;(modify ?rec (programastv ?new-progs))
	(modify ?rec (final? TRUE))
	(focus mostrar)
)


(defrule puntuacion-rec
	?rec <- (recomendacion (persona ?pers) (programastv $?progs) (final? FALSE) )
	(send ?rec get-preferit)
	=>
	(printout t "debug recurs" crlf)
	(bind ?preferit (send ?rec get-preferit))
	(bind ?i 1)
	(bind ?actorsP(create$ )) 	
	(bind ?productorsP(create$ ))
	(bind ?generoP(create$ )) 
	(bind ?anyoP (send ?preferit get-Anyo))
	(bind ?directorP (send ?preferit get-CDirector))

	;; Recuperamos la información propia de los Series y Peliculas
	(if (not(eq (class ?preferit) Documental)) then 
		;; Recuperamos la lista de Actores preferidos
		(bind ?actorsP(send (nth$ ?i ?progs) get-CActor))
		
		;; Recuperamos la lista de Productores preferidos 
		(bind ?productorsP (send (nth$ ?i ?progs) get-CProductor))
		
		;; Recuperamos la lista de Generos preferidos
		(bind ?generoP(send (nth$ ?i ?progs) get-CGenero))

	;; Recuperamos la información propia de los Documentales
	else 
		(bind ?generoP(send (nth$ ?i ?progs) get-Tematica))
	)

	;;Iteramos para todos los programas
	(while (<= ?i (length$ $progs)) do   
		(bind ?prog (nth$ ?i ?progs))
		

		;; Puntuacion especifica de Series y Peliculas (si ?preferit no era de este tipo su información sera nula y no se iterara en ninguno de los bucles)
		(if (not(eq (class ?prog) Serie)) then
			
			;;Tractem Actors
			(bind ?actorsB (send ?prog get-CActor))
			(loop-for-count (?j 1 (length$ ?actorsP)) do
				(bind ?aux (nth$ ?j ?actorsP))
				(if (not (eq  (member$ ?aux ?actorsB) FALSE))then
					(bind ?aux(+ (send (nth$ ?i ?prog) get-Puntuacion) 1))
					(send ?prog put-Puntuacion ?aux)
					(assert (ProgramaTv Puntuacion ok))
				)
			)

			;;Tractem Productors
			(bind ?productorsB (send ?prog get-CProductor))
			(loop-for-count (?j 1 (length$ ?productorsP)) do
				(bind ?aux (nth$ ?j ?productorsP))
				(if (not (eq  (member$ ?aux ?productorsB) FALSE))then
					(bind ?aux(+ (send (nth$ ?i ?prog) get-Puntuacion) 1))
					(send ?prog put-Puntuacion ?aux)
					(assert (ProgramaTv Puntuacion ok))
				)
			)
			;;Tractem Genero (no queremos que haya muchas veces el mismo genero repetido)
			(bind ?generosB (send ?prog get-CProductor))
			(loop-for-count (?j 1 (length$ ?generoP)) do
				(bind ?aux (nth$ ?j ?generoP))
				(if (not (eq  (member$ ?aux ?generosB) FALSE)) then
					(bind ?aux (send  ?prog get-Puntuacion))
					(if (> ?aux 0) then
						(bind ?aux(+ ?aux 1))
						(send(nth$ ?i ?prog) put-Puntuacion ?aux)
						(assert (ProgramaTv Puntuacion ok))
					)
				)
			)

		)
		
		

		(bind ?i (+ ?i 1))
	)
)



;;;Modulo mostrar
(defmodule mostrar "Imprimir resultado"
	(import MAIN ?ALL)
	(import preguntas-generales ?ALL)
	(import deduccion ?ALL)
	(export ?ALL)
)

(defrule escriure "Escriu els resultats"

	?rec <- (recomendacion (programastv $?progs) (final? TRUE))=>
	(printout t "Recomendaciones:" crlf)
	(printout t " " crlf)
	
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

	(bind ?i 1)
	(while (<= ?i 6) do 
		(bind ?aux (nth$ ?i ?new-progs))
		(printout t "=======" ?i "========" crlf) 
		(printout t " "crlf)
		(if  (eq (class ?aux) Documental) then
			(printout "Documental" crlf)
			(printout "Titulo:" (send ?aux get-Titulo) crlf)
			(printout "Tematica:" (send ?aux get-Tematica) crlf)
		else
			(bind ?actores(create$ ))
			;(bind ?directoresAux (send (nth$ ?i ?progs) get-CActor))
			(bind ?directoresAux (send ?aux get-CActor))
			(loop-for-count (?j 1 (length$ ?directoresAux)) do
				(bind ?aux (nth$ ?j ?directoresAux))
				(bind ?nombre (send ?aux get-NombreApellido))
				(bind ?actores (create$ ?actores ?nombre))
			)	
			;(bind ?productores(create$ ))
			;(bind ?directoresAux (send ?aux get-CProductor))
			;(bind ?directoresAux (send (nth$ ?i ?progs) get-CProductor))
			;(loop-for-count (?j 1 (length$ ?directoresAux)) do
			;	(bind ?aux (nth$ ?j ?directoresAux))
			;	(bind ?nombre (send ?aux get-NombreApellido))
			;	(bind ?productores(create$ ?productores ?nombre))
			;)
		)	
		(if (eq (class ?aux) Serie)then
			(printout "Serie" crlf)
			(if (eq(send ?aux get-EnEmision) TRUE) then
				(printout "Actualmente en emision" crlf)			
			)
			(printout "Titulo:" (send ?aux get-Titulo) crlf)
			(printout "Temporadas:" (send ?aux get-Temporadas) "   ")
			(printout "Genero:" (send ?aux get-CGenero) crlf)
			(printout "Capitulos:" (send ?aux get-Capitulos) crlf)
			(printout "Actores:"  ?actores crlf)
			;(printout "Productores:" ?productores crlf)
		)
		(if(eq (class ?aux) Pelicula) then
			(printout "Pelicula" crlf)
			(printout "Genero:" (send ?aux get-CGenero) crlf)
			(printout "Actores:"  ?actores crlf)
			;(printout "Productores:" ?productores crlf)
		)
		

		(bind ?directores (create$ ))
		(bind ?directoresAux (send (nth$ ?i ?progs) get-CDirector))
		(loop-for-count (?j 1 (length$ ?directoresAux)) do
			(bind ?aux (nth$ ?j ?directoresAux))
			(bind ?nombre (send ?aux get-NombreApellido))
			(bind ?directores (create$ ?directores ?nombre))
		)
		(printout t "Directores: " ?directores crlf)
		(printout t "Idioma: " (send ?aux get-Idioma) crlf)
		(printout t "Anyo: " (send ?aux get-AnyoContenido) crlf)

		(printout t " "crlf)
		(printout t " "crlf)
		(printout t " "crlf)
		(bind ?i (+ ?i 1))
		(bind ?num(pregunta-numerica "Que programa prefieres" 1 5)) 
		(bind ?aux (nth$ ?num ?new-progs))
		(assert (recomendacion (preferit ?aux)))
		(bind ?num (si-o-no-p "Desea actualizar las recomendaciones?") )
		(if (eq ?num TRUE)then
			(modify ?rec (final? FALSE))
			(focus deduccion)
		else ;;¿como se pone fin?
		)
		
	)
)

