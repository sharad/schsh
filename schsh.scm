#!/usr/bin/guile -s
!#


;; https://brennan.io/2015/01/16/write-a-shell-in-c/
(use-modules (ice-9 textual-ports))


(define (loop x)
  x
  (loop x))

(define (shell_loop)
  (display "hello world")
  (newline))

(define (read-line)
  (get-line (current-input-port)))

(define (split-line line)
  line)

(define (execute-line args)
  ;; (display (string-append "running " args))
  (system args))


(define (shell_loop)
  (display "prompt> ")
  (let ((line (read-line)))
    ;; (display line)
    ;; (newline)
    (when (not
           (or
            (equal? line "exit")
            (eof-object? line)))
      (let* ((args (split-line line))
             (status (execute-line args)))
        status
        ;; (newline)
        ;; (display "Next\n")
        (shell_loop)))))



(define (scsh)
  (display "hello world")
  (newline)
  (shell_loop))


;; (loop (print (read)))

(scsh)
