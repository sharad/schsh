#!/usr/bin/guile -s
!#


;; https://brennan.io/2015/01/16/write-a-shell-in-c/



(define (shell_loop)
  (display "hello world")
  (newline))


(define (scsh)
  (display "hello world")
  (newline)
  (shell_loop))


(scsh)
