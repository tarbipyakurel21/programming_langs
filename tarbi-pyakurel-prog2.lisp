; Author: Tarbi Pyakurel
; USM ID: w10172900
; Course: CSC 408
; Description: This program reads integer numbers from the user into a list
;              displays the numbers and a menu which lays options to display
;              count of elements, sum of elements, maximum of elements and
;              occurences of an individual element and exit option to end the
;              program.


(defun count-elements(nums)
;Returns the number of elements in the list
(length nums))

; Returns the sum of elements using do list
; iterates through the list and keeps adding elements to sum
(defun sum-elements(nums)
(let ((sum 0))
(dolist (x nums sum)
(setq sum (+ sum x)))))

; finds the maximum element in the list
(defun find-maximum (nums)
; apply takes in funtion max and list and returns output of max
; if nums is null return nil(true) otherwise apply max
(if (null nums)
nil
(apply #'max nums)))

;returns number of occurrences of an individual function
(defun count-occurrences(nums target)
; uses dolist to iterate through the list
(let ((count 0))
(dolist (item nums count)
(if (= item target)

(setq count (+ count 1))))))

; main function or entry point of application
(defun main()
; initialize empty list
(let ((my-list '())
; initialize user-choice for menu
(user-choice 0))

;loop for data input
(loop
(format t "Enter a number for the list: ")
(force-output)
; read the element into num
(let ((num (read)))
;add the element to the list by wrapping num into a list
(setq my-list (append my-list (list num)))
(format t "~%"))
; ask if user wants to input more numbers y/n is y continue if n exit the
; loop
(format t "Enter more numbers y/n ")
(force-output)
; if enter-more is n exit the loop else continue the loop and ask for numbers
(let ((enter-more (read)))
(format t "~%")
(when (equal enter-more 'n) (return))))

;Display the list
(format t "~%Here is what was read into the list ~A~%" my-list)

; menu loop
(loop
(format t "~% Choose an option:~%1 -Count elements~%2 -Sum elements~%3 -Find maximum~%4 -Count occurences~%5 -Exit~%Choice: ")
; set user-choice from the menu options prompting user input
(force-output)
(setq user-choice (read))
(format t "~%")

; check if user-choice matches the menu options and apply according to
; the menu
(cond
;if user choice is 1 display the count of the list
((= user-choice 1)
(format t "There are ~D elements in the list.~%"(count-elements my-list)))

((= user-choice 2)
(format t "The sume of the elements is ~D.~%"(sum-elements my-list)))

((= user-choice 3)
(format t "The largest number in the list is ~D.~%"(find-maximum my-list)))

; ask user to enter the target number to search occurrences for
((= user-choice 4)
(format t "Enter number to search for: ")
(force-output)
; apply the count-occurrences function which returns the occurrences
(let ((target (read)))
(format t "There are ~D occurrences of ~D in the list.~%"
 (count-occurrences my-list target) target)))

; if user choice is 5 exit the loop
((= user-choice 5) (return))
; if user enters invalid number loop again after display message
(t (format t "Invalid option, please try again.~%"))))))

(main)
