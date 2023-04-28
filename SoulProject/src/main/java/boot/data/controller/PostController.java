package boot.data.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import boot.data.service.PostService;

@Controller
public class PostController {

	
	@Autowired
	PostService service;
	

}
