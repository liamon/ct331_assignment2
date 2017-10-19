#lang racket

(define example_tree '(((() 5 ()) 9 (() 17 ())) 28 ((() 33 ()) 40 (() 45 ()))))

(define (display_sorted tree)
  (cond [(empty? (get_left_child tree)) (display (value tree))]))

(define (present_in_tree item tree)
  (cond [(empty? tree) #f]
        [(equal? item (value tree)) #t]
        [(< item (value tree)) (present_in_tree item (get_left_child tree))]
        [else (present_in_tree item (get_right_child tree))])) ; (> item tree_value)

(define (insert item tree) ; TODO This should return a tree, I think.
  (cond [(empty? tree) '(() item ())]
        [(equal? item (value tree)) '()]
        [(< item (value tree)) (insert item (get_left_child tree))]
        [else (insert item (get_right_child tree))]))

(define (insert_list lst tree)
  (if (empty? lst) tree
      (insert_list (cdr lst) (insert (car lst) tree))))

(define (tree_sort lst)
  (display_sorted)) ; TODO

(define (higher_order_tree_sort lst order_function)
  (display_sorted)) ; TODO

(define (value tree)
  (cadr tree))

(define (get_left_child tree)
  (car tree))

(define (get_right_child tree)
  (caddr tree)) ; Can't say (cddr tree), as that would return the right child put inside a list.

(present_in_tree 40 example_tree)
(present_in_tree 109 example_tree)
