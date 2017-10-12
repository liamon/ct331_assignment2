#lang racket

(provide ins_beg)
; This makes a list with only one element, el, and then appends the
; elements of lst onto the end of this new list.
(define (ins_beg el lst)
  (append (list el) lst))
