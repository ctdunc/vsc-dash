;extends
(call
  (identifier) @name (#eq? @name clientside_callback) 
  (argument_list 
    ((string (string_content) 
	     @javascript
	    ))
	)
)
; functions declared in dictionaries
(call
  function: (identifier) @dict_id (#eq? @dict_id dict)
  arguments: (argument_list
	(keyword_argument
	  name: (identifier) @key (#eq? @key function)
	  value: (string 
		(string_content) @javascript
	))
  )
)
(dictionary
  (pair
	key: (string (string_content) @key (#eq? @key function))
	value: (string 
		(string_content) @javascript
	)
  )
)