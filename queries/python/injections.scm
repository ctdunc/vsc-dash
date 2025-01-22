;extends
(call
  (identifier) @name (#eq? @name clientside_callback) 
  (argument_list 
    ((string (string_content) 
	     @python
	    ))
	)
)
