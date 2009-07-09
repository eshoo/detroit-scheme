; tests for extras library
(use 'test)

(include 'extras)
(use 'fold)
(use 'amk)
(use 'combine)
(use 'count)
(use 'depth)
(use 'exists)
(use 'explode)
(use 'filter)
(use 'flatten)
(use 'fluid-let)
(use 'for-all)
(use 'implode)
(use 'intersection)
(use 'iota)
(use 'list-to-set)
(use 'make-partitions)
(use 'mergesort)
(use 'partition)
(use 'permute)
(use 'quicksort)
(use 'read-file)
(use 'read-line)
(use 'regex)
(use 'remove)
(use 'replace)
(use 'string-contains)
(use 'string-split)
(use 'substitute)
(use 'transpose)
(use 'union)
(use 'write-to-string)

(check (combine 2 '(a b c)) => '((a b) (a c) (b c)))
(check (combine* 2 '(a b c)) => '((a a) (a b) (a c) (b b) (b c) (c c)))
(check (count '(a (b (c)) d . e)) => 5)
(check (depth '(a (b (c d (e))))) => 4)
(check (exists < '(9 1) '(8 2) '(7 3)) => #t)
(check (explode 'supernova) => '(s u p e r n o v a))
(check (filter number? '(a 1 b 2 c 3)) => '(1 2 3))
(check (flatten '(a (b ((c) d . e)))) => '(a b c d e))
(check (let ((a 0)) (let ((f (lambda () a))) (fluid-let ((a 1)) (f)))) =>  1)
(check (for-all < '(1 7) '(2 8) '(3 9)) => #t)
(check (implode '(b l a c k h o l e)) => 'blackhole)
(check (intersection '(v w x) '(w x y) '(x y z)) => '(x))
(check (iota 17 21) => '(17 18 19 20 21))
(check (list->set '(a b c b c)) => '(a b c))
(check (make-partitions 4) => '((4) (3 1) (2 2) (2 1 1) (1 1 1 1)))
(check (mergesort < '(5 3 7 9 1)) => '(1 3 5 7 9))
(check (partition even? '(1 2 3 4 5)) => '((2 4) (1 3 5)))
(check (permute 2 '(a b c)) => '((a b) (b a) (a c) (c a) (b c) (c b)))
(check (permute* 2 '(a b c)) => '((a a) (a b) (a c) (b a) (b b) (b c) (c a) (c b) (c c))) 
(check (quicksort < '(5 3 7 9 1)) => '(1 3 5 7 9))
(check (re-match (re-comp "^a[b-y]+z$") "abz") => "abz")
(check (re-match (re-comp "^a[b-y]+z$") "abbbz") => "abbbz")
(check (re-match (re-comp "^a[b-y]+z$") "az") => #f)
(check (remove number? '(a 1 b 2 c 3)) => '(a b c))
(check (replace '(x) '(y) '(lambda (x) y)) => '(lambda (y) y))
(check (string-contains "gemeinsam" "ein") => "einsam")
(check (string-contains "democracy" "people") => #f)
(check (string-split #\space " to be  or  not to be ") => '("to" "be" "or" "not" "to" "be"))
(check (substitute '(* (+ 5 7) 9) '(((+ 5 7) . 12))) => '(* 12 9))
(check (transpose '((1 2 3) (4 5 6))) => '((1 4) (2 5) (3 6)))
(check (union '(v w x) '(w x y) '(x y z)) => '(v w x y z))
(check (write-to-string '(a 1 #\c #(v) #t "str" "\"s\"" (a . d))) => "(a 1 #\\c #(v) #t \"str\" \"\\\"s\\\"\" (a . d))")
(check (display-to-string '(a 1 #\c #(v) #t "str" "\"s\"" (a . d))) => "(a 1 c #(v) #t str \"s\" (a . d))")
; XXX: fails inside jar
;(check (with-input-from-file "test/extras.scm" read-line) => "; tests for extras library")

; produce a report
(check-report)
