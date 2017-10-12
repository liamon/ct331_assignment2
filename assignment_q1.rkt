#lang racket

(define (pair_numbers num1 num2)
  (cons num1 num2))

(define (three_list num1 num2 num3)
  (cons num1 (cons num2 (cons num3 '()))))

(define (list_with_cons str num nested_list)
  (cons str (cons num (cons nested_list '()))))

(define (list_with_list str num nested_list)
  (list str num nested_list))

(define (list_with_append str num nested_list)
  (append (list str) (list num) (list nested_list)))

(pair_numbers 2 3)
(three_list 7 6 8)

(list_with_cons "Hello!" 8 '(2 4 5))
(list_with_list "a string" 9 '(21 3 5))
(list_with_append "Racket" 22 '(8 7 88))
