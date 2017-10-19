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

(provide count_instances)
; This is a recursive function. The base case is an empty list, which
; returns zero. For all other lists, if the first element of the list is
; the item I am looking for, then I return one plus count_instances called
; on the rest of the list. Otherwise, I return zero plus that value.
(define (count_instances item lst)
  (cond [(null? lst) 0]
        [(equal? item (car lst)) (+ 1 (count_instances item (cdr lst)))]
        [else (count_instances item (cdr lst))]))

(provide count_instances_tr)
(define (count_instances_tr item lst)
  (count_instances_tr_helper item lst 0))
 
; I am deliberately not including a (provide count_instances_tr_helper)
; statement. This is because this is a helper function for the tail-recursive
; count_instances_tr. This is similar to a private method in object-oriented programming.
(define (count_instances_tr_helper item lst count)
  (cond [(empty? lst) count]
        [(equal? item (car lst)) (count_instances_tr_helper item (cdr lst) (+ 1 count))]
        [else (count_instances_tr_helper item (cdr lst) count)]))

(provide count_instances_deep)
; This function needs to check if any of the list's elements are also lists
; and recursively call itself on that sublist if so.
(define (count_instances_deep item lst)
  (cond [(empty? lst) 0]
        [(list? (car lst)) (count_instances_deep lst)]
        [(equal? item (car list)) (+ 1 (count_instances_deep item (cdr lst)))]
        [else (count_instances_deep (cdr lst))]))
