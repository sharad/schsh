#!/usr/bin/guile -s
!#

;; https://brennan.io/2015/01/16/write-a-shell-in-c/
(use-modules (ice-9 textual-ports))
(use-modules (ice-9 readline))


(define (loop x)
  x
  (loop x))

(define (shell_loop)
  (display "hello world")
  (newline))

(define (read-line prompt)
  (readline prompt))

(define (split-line line)
  line)

(define (execute-line args)
  (system args))

(define (init-readline prompt1 prompt2)
  (activate-readline)
  (set-readline-prompt! prompt1 prompt2)
  (when #f
    (set-readline-input-port! (current-input-port)))
  (with-readline-completion-function filename-completion-function))

(define (shell-loop)
  (let ((prompt "prompt> ")
        (prompt2 "<prompt"))
    (init-readline prompt prompt2)
    (let* ((line (read-line prompt)))
      ;; (display line)
      ;; (newline)
      (when (not
             (or
              (equal? line "exit")
              (eof-object? line)))
        (let* ((args (split-line line))
               (status (execute-line args)))
          status
          (shell-loop))))))

(define (scsh)
  (display "hello world")
  (newline)
  (shell-loop))


;; (loop (print (read)))

(scsh)
