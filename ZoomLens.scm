(require 'list-lib)

(define-simple-class ZoomLens (processing.core.PApplet)
	(zoomLens :: toxi.math.ZoomLensInterpolation init-value: (make toxi.math.ZoomLensInterpolation))		
	(smoothStep :: java.lang.Float init-value: (java.lang.Float 0.15) )
	((setup)
		(size 800 400 codeanticode.glgraphics.GLConstants:GLGRAPHICS)
	)
	((draw)
		(background 255)
		(zoomLens:setLensPos (/ mouseX 400.0) smoothStep)
		(zoomLens:setLensStrength
			(/ (- mouseY (* height 0.5)) (* height 0.5) )
			smoothStep
		)
		(for-each (lambda (x)
				(letrec (
				  (xx (java.lang.Float x))
				  (t (/ xx 400.0))
				  (y (zoomLens:interpolate 0 400 t))
				  )
				(if (= 0 (modulo xx 10))
					(line y 0 y height)
				)
				(point (+ y 400) xx)
				))
			(iota 400)
		)
	)
)


(define p (ZoomLens) )
(ZoomLens:runSketch (String[] "--present" "ZoomLens")  p)

