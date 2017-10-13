#lang racket

(require (file "assignment_q2.rkt")
         (file "assignment_q3.rkt"))

;This structure allows a single function call
;to run every test in sequence, rather than
;calling each function separately. 
(define (runTests)
  (begin
    (display "Running tests...\n\n")
    
    ;begin calling test functions
    (display (test_result_message test_ins_beg_atom "Inserting an atom at the start of a list"))
    (display (test_result_message test_ins_beg_list "Inserting a list at the start of a list"))
    (display (test_result_message test_ins_end_atom "Inserting an atom at the end of a list"))
    (display (test_result_message test_ins_end_list "Inserting a list at the end of a list"))

    (display (test_result_message test_count_top_level_empty "Counting the top-level elements in an empty list"))
    (display (test_result_message test_count_top_level_atoms "Counting the top-level elements in a list of atoms"))
    (display (test_result_message test_count_top_level_lists "Counting the top-level elements in a list of lists"))
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

(define (test_ins_end_atom)
  (equal? '(2 3 4 5) (ins_end 5 '(2 3 4))))

(define (test_ins_end_list)
  (equal? '(4 5 6 (1 2)) (ins_end '(1 2) '(4 5 6))))

(define (test_count_top_level_empty)
  (= 0 (count_top_level '())))

(define (test_count_top_level_atoms)
  (= 4 (count_top_level '(9 8 76 2))))

(define (test_count_top_level_lists)
  (= 3 (count_top_level '((8 2) (8 7 6) (2)))))

;End test functions

;Run the tests
(runTests)