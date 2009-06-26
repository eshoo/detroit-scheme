

;; testing of core library 

(use 'test)

(define (test:core)
 (check (call-with-values (lambda () (values 1 2)) (lambda (x y) y)) => 2)
 (check (receive (a b) (values 1 2) (list a b)) => '(1 2)))

(test:core)
(check-report)
