
(ert-deftest eval-action-string-rule ()
  (should (equal (electric-operator-eval-action "tttt" 0) "tttt")))

(ert-deftest eval-action-typical-function-rule ()
  (should (equal (electric-operator-eval-action (lambda () "tttt") 0) "tttt")))

(ert-deftest eval-action-nil-function-rule ()
  (should (equal (electric-operator-eval-action (lambda () nil) 0) nil)))

(ert-deftest eval-action-noop ()
  :expected-result :failed
  (should (equal (electric-operator-eval-action 'noop 0) nil))
  (should (equal (electric-operator-eval-action (lambda () 'noop) 0) nil))
  (should (equal (electric-operator-eval-action (list 'noop) 0) nil))
  (should (equal (electric-operator-eval-action (list 'noop "a") 0) nil))
  (should (equal (electric-operator-eval-action (list (lambda () 'noop) "a") 0) nil))
  )


(ert-deftest eval-action-list-rule ()
  (should (equal (electric-operator-eval-action (list "tttt") 0) "tttt"))
  (should (equal (electric-operator-eval-action (list (lambda () "tttt")) 0) "tttt"))
  (should (equal (electric-operator-eval-action (list (lambda () "tttt") "aaa" "bbb") 0) "tttt"))
  (should (equal (electric-operator-eval-action (list (lambda () nil) "tttt" "bbb") 0) "tttt"))
  )
