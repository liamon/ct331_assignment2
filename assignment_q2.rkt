#lang racket

(provide ins_beg)
; This makes a list with only one element, el, and then appends the
; elements of lst onto the end of this new list.
(define (ins_beg el lst)
  (append (list el) lst))

(provide ins_end)
; This makes a new list with only one element, el, and then appends the
; single element in this new list onto the end of lst.
(define (ins_end el lst)
  (append lst (list el)))
