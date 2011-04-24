;; compare with the original from ToxicLibs at http://toxiclibs.org/
;; note this is not good scheme code :D follows too many processing and java structures
;; and unlearned voodoo

(require 'list-lib)

;(define Map map) ; note that Processing's map conflicts, but not used here anyway


;; execute with: ./prokawa-toxi.sh -f ./PolarUnravel.scm

(define-simple-class PolarUnravel (processing.core.PApplet) 
	(transition :: java.lang.Float init-value: (make java.lang.Float 0.0) )
	(transTarget :: java.lang.Float init-value: (make java.lang.Float 0.0) )
	(is :: toxi.math.SigmoidInterpolation init-value: (make toxi.math.SigmoidInterpolation 3))
	(col :: toxi.color.TColor )
	(normUp :: toxi.geom.Vec2D )
	((setup) 
		(size 680 382 codeanticode.glgraphics.GLConstants:GLGRAPHICS)
	)
	((draw)
		(background 255) 
		(let* ((ww (* width 0.5)))
		(let* ((hh  (* height 0.5)))
		(translate ww hh)
		(set! transition (+ transition (* (- transTarget transition ) 0.01) ) )
		(set! col (toxi.color.TColor:newHSV 0 1 1))
		(set! normUp (make toxi.geom.Vec2D 0 -1))
		(for-each 	(lambda (i  :: gnu.math.IntNum )
				(let*  ((theta (radians i)))
				 (let* ((polar (make toxi.geom.Vec2D 100 theta)))
					(col:setHue (modulo (/ (*:.y polar) TWO_PI) 1) )
					(let* ((len (* (noise (* (*:.y polar) 4)) 100 )))
					 (let* ((circ ((polar:copy):toCartesian)))
					  (let* ((linear (make toxi.geom.Vec2D
						(+	(/	(*	(-
						toxi.math.MathUtils:THREE_HALVES_PI
						(*:.y polar)
						)	ww	)	PI	)	ww	)	
					  0) ))
					(let* ((dir (circ:getNormalized)))
					 (circ:interpolateToSelf linear transition is)
					 ((dir:interpolateToSelf normUp transition is):normalizeTo len)
					 (stroke (col:toARGB))
					 (line (*:.x circ) (*:.y circ) (+ (*:.x circ) (*:.x dir)) (+ (*:.y circ) (*:.y dir)) )
			) ) ) ) ) ) )   
			(iota 180 270 2) 
		)
	   ) )
	)
	((mousePressed)
		(set! transTarget (+ transTarget 1))
		(set! transTarget (modulo transTarget 2))
	)

 )

(processing.core.PApplet:main (make String[] "--present" "PolarUnravel"))

