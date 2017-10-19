#lang racket

(define example_tree '(((() 5 ()) 9 (() 17 ())) 28 ((() 33 ()) 40 (() 45 ()))))

(define (display_sorted tree)
  (cond [(and (empty? (left_child tree)) (empty? (right_child tree))) (display (value tree))]))

(define (present_in_tree item tree)
  (cond [(empty? tree) #f]
        [(equal? item (value tree)) #t]
        [(< item (value tree)) (present_in_tree item (left_child tree))]
        [else (present_in_tree item (right_child tree))])) ; (> item tree_value)

(define (insert item tree)
  (cond [(empty? tree) '(() item ())]
        [(equal? item (value tree)) '()]
        [(< item (value tree)) (insert item (left_child tree))]
        [else (insert item (right_child tree))]))

(define (value tree)
  (cadr tree))

(define (left_child tree)
  (car tree))

(define (right_child tree)
  (caddr tree)) ; Can't say (cddr tree), as that would return the right child put inside a list.

(present_in_tree 40 example_tree)
(present_in_tree 109 example_tree)
