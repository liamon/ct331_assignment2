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

(provide count_top_level)
; This is a recursive function. If the list is empty, then the number of
; items in the list is zero. Otherwise, the number is one plus the number
; of items in a list one smaller than this list.
(define (count_top_level lst)
  (if (null? lst)
      0
      (+ 1 (count_top_level (cdr lst)))))
