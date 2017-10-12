#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n")
    ;begin calling test functions
    (printf "1: ~a" (test_ins_beg_atom))
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_ins_beg_atom) ; eq? checks if they refer to the same object
  (equal? '(1 2 3 4) (ins_beg 1 '(2 3 4)))) ; so I need to use equal?

(define (test_ins_beg_list)
  (equal? '((1 6) 2 3 4) (ins_beg '(1 6) '(2 3 4))))

;End test functions

;Run the tests
(runTests)