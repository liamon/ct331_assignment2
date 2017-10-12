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
    (display (test_result_message test_ins_beg_atom "Inserting an atom at the start of a list"))
    (display (test_result_message test_ins_beg_list "Inserting a list at the start of a list"))
    ;end calling test functions
    (display "\nTests complete!\n")))

;Begin test functions
(define (test_result_message test_function test_description)
  (string-append test_description ": " (if (test_function)
                                       "SUCCESS"
                                       "FAILURE") "\n"))

(define (test_ins_beg_atom) ; eq? checks if they refer to the same object
  (equal? '(1 2 3 4) (ins_beg 1 '(2 3 4)))) ; so I need to use equal?

(define (test_ins_beg_list)
  (equal? '((1 6) 2 3 4) (ins_beg '(1 6) '(2 3 4))))

;End test functions

;Run the tests
(runTests)