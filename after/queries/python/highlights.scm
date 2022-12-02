;; inherits: python
;; extends

 (decorator  "@" @function.decorator)
(decorator (call arguments: (argument_list ["(" ")"] @function.decorator)))
(decorator (call arguments: (argument_list (integer) @function.decorator)))

  
