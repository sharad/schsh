#!/usr/bin/guile -s
!#

;; https://brennan.io/2015/01/16/write-a-shell-in-c/


(define (loop x)
  x
  (loop x))

(define (shell_loop)
  (display "hello world")
  (newline))

(define (read-line)
  (read))

(define (split-line line)
  line)

(define (execute-line args)
  args)

(define (shell_loop)
  (display "prompt> ")
  (let ((line (read-line)))
    (when (not
           (or
            (equal? line "exit")
            (eof-object? line)))
      (let* ((args (split-line line))
             (status (execute-line args)))
        status)
      (newline)
      (shell_loop))))


(define (scsh)
  (display "hello world")
  (newline)
  (shell_loop))


;; (loop (print (read)))

(scsh)
