#lang racket

(define example_tree '(((() 5 ()) 9 (() 17 ())) 28 ((() 33 ()) 40 (() 45 ()))))
(define example_to_sort '(9 2 73 55 8 87 34 16))

; I'm using cond rather than if here as it does not require an "else".
(define (display_sorted tree)
  (begin (cond [(not (empty? (left_child tree))) (display_sorted (left_child tree))])
         (printf "~a~n" (value tree)) ; ~n is a platform-independent newline.
         (cond [(not (empty? (right_child tree))) (display_sorted (right_child tree))])))

(define (present_in_tree item tree)
  (cond [(empty? tree) #f]
        [(equal? item (value tree)) #t]
        [(< item (value tree)) (present_in_tree item (left_child tree))]
        [else (present_in_tree item (right_child tree))])) ; (> item tree_value)

(define (insert item tree)
  (higher_order_insert item tree <))

; I have split the logic for insert off into a higher-order function.
; This will be used in higher_order_tree_sort, making coding it much easier.
(define (higher_order_insert item tree is_on_left)
  (cond [(empty? tree) (list '() item '())]
        [(equal? item (value tree)) tree]
        [(is_on_left item (value tree))
         (list (insert item (left_child tree)) (value tree) (right_child tree))]
        [else ; same as "(is_on_right item (value tree)"
         (list (left_child tree) (value tree) (insert item (right_child tree)))]))

(define (insert_list lst tree)
  (if (empty? lst) tree
      (insert_list (cdr lst) (insert (car lst) tree))))

(define (higher_order_insert_list lst tree is_on_left)
  (if (empty? lst) tree
      (higher_order_insert_list (cdr lst) (higher_order_insert (car lst) tree is_on_left) is_on_left)))

(define (tree_sort lst)
  (display_sorted (insert_list lst '())))

(define (higher_order_tree_sort lst order_function)
  (display_sorted (higher_order_insert_list lst '() order_function)))

(define (value tree)
  (cadr tree))

(define (left_child tree)
  (car tree))

(define (right_child tree)
  (caddr tree)) ; Can't say (cddr tree), as that would return the right child put inside a list.

(define (ascending_last_digit x y)
  (< (remainder x 10) (remainder y 10)))

(display_sorted example_tree)

(present_in_tree 40 example_tree)
(present_in_tree 109 example_tree)

(insert 8 example_tree)
(insert_list '(2 8 34 100) example_tree)

(tree_sort example_to_sort)

(higher_order_tree_sort example_to_sort <)
(higher_order_tree_sort example_to_sort >)
(higher_order_tree_sort example_to_sort ascending_last_digit)
