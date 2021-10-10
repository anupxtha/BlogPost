package com.blog.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.blog.dao.CommentRepository;
import com.blog.dao.PostRepository;
import com.blog.dao.UserRepository;
import com.blog.entities.Category;
import com.blog.entities.Comment;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.FileUploadHelper;
import com.blog.helper.Message;
import com.blog.helper.ProfileUploadHelper;
import com.blog.services.CategoryServices;
import com.blog.services.CommentServices;
import com.blog.services.PostServices;
import com.blog.services.UserServices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private PostServices postServices;

	@Autowired
	private CategoryServices categoryServices;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserServices userServices;

	@Autowired
	private FileUploadHelper fileUploadHelper;

	@Autowired
	private ProfileUploadHelper profileUploadHelper;

	@Autowired
	private PostRepository postRepository;

	@Autowired
	private CommentRepository commentRepository;

	@Autowired
	private CommentServices commentServices;

	// @ModelAttribute
	// public void CommonDataForModel(Model m, Principal principal) {
	// String email = principal.getName();

	// User user = this.userRepository.getUserByUserName(email);

	// List<Category> list = this.categoryServices.getAllCategory();

	// List<Post> postList = this.postServices.getAllPost();

	// m.addAttribute("user", user);
	// m.addAttribute("category", list);
	// m.addAttribute("post", postList);
	// }

	@RequestMapping("")
	public String dashboard(Model m, HttpSession session, Principal principal) {
		String email = principal.getName();

		User user = this.userRepository.getUserByUserName(email);

		List<Category> list = this.categoryServices.getAllCategory();

		List<Post> postList = this.postServices.getAllPost();

		m.addAttribute("user", user);
		m.addAttribute("category", list);
		m.addAttribute("post", postList);

		session.setAttribute("logedIn", new Message("Successful", "alert-success"));

		return "Ndashboard";
	}

	@RequestMapping(path = "/postblog", method = RequestMethod.POST)
	public String postblog(@ModelAttribute("post") Post post, @RequestParam("fileImage") MultipartFile multipartFile,
			Model m, HttpSession session, Principal principal) throws IOException {

		String email = principal.getName();

		User user = this.userRepository.getUserByUserName(email);

		String fileName = multipartFile.getOriginalFilename();

		post.setImage(fileName);
		post.setUser(user);
		post.setPost_date(java.time.LocalDateTime.now());

		Post p = this.postServices.savePost(post);

		// System.out.println(p);
		// m.addAttribute("post",p);

		try {

			if (multipartFile.isEmpty()) {
				System.out.println("File is empty");
			}

			// file upload code
			boolean f = this.fileUploadHelper.uploadFile(multipartFile);

			if (f == true) {
				System.out.println("Successfully Post Image Uploaded");
			} else {
				System.out.println("Something went wrong in FileUpload Helper");
			}

		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println("Error occur");
		}

		return "redirect:/user";

	}

	@RequestMapping(path = "/showPostofUser", method = { RequestMethod.POST, RequestMethod.GET })
	public String showPostofUser(@RequestParam("uId") int uId, Model md) {

		try {
			Thread.sleep(250);

			List<Post> postofUser = this.postRepository.findByUserId(uId);

			md.addAttribute("pl", postofUser);

			return "showpost";

		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "/";
		}

	}

	@RequestMapping(path = "/post/{id}", method = { RequestMethod.GET, RequestMethod.POST })
	public String getPostById(@PathVariable("id") int id, Model m, Principal principal) {

		try {
			String email = principal.getName();

			User user = this.userRepository.getUserByUserName(email);

			List<Comment> comment = this.commentRepository.findByPostId(id);

			boolean c = true;
			if (comment == null) {
				c = false;
			}

			Post singlePost = this.postRepository.findPostId(id);

			User postUser = singlePost.getUser();

			List<Category> list = this.categoryServices.getAllCategory();

			m.addAttribute("comment", comment);
			m.addAttribute("user", user);
			m.addAttribute("category", list);
			m.addAttribute("sPost", singlePost);
			m.addAttribute("postUser", postUser);
			m.addAttribute("T", c);

			return "singlePost";
		} catch (Exception e) {
			return "";
		}

	}

	@RequestMapping(path = "/comment", method = { RequestMethod.GET, RequestMethod.POST })
	public String comment(@ModelAttribute("comment") Comment comment) {

		int postId = comment.getPost().getId();

		this.commentServices.addComment(comment);

		String red = "user/post/" + postId;
		System.out.println(red);

		return "redirect:/user/post/" + postId;
	}

	@RequestMapping(path = "/upateProfile", method = { RequestMethod.GET, RequestMethod.POST })
	public String upateProfile(@RequestParam("name") String name, @RequestParam("email") String email,
			@RequestParam("profileImage") MultipartFile multipartFile) {

		User u = this.userServices.getUserByName(email);

		u.setProfile(multipartFile.getOriginalFilename());
		u.setName(name);
		u.setEmail(email);

		int userId = u.getId();

		this.userServices.updateUser(u, userId);

		try {

			if (multipartFile.isEmpty()) {
				System.out.println("File is empty");
			}

			// file upload code
			boolean f = this.profileUploadHelper.uploadProfile(multipartFile);

			if (f == true) {
				System.out.println("Successfully Post Image Uploaded");
			} else {
				System.out.println("Something went wrong in FileUpload Helper");
			}

		} catch (Exception e) {
			// e.printStackTrace();
			System.out.println("Error occur");
		}

		return "redirect:/user";
	}

}
