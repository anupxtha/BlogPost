package com.blog.controller;

import java.net.http.HttpRequest;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.blog.dao.PostRepository;
import com.blog.dao.UserRepository;
import com.blog.entities.Category;
import com.blog.entities.Post;
import com.blog.entities.User;
import com.blog.helper.Message;
import com.blog.services.CategoryServices;
import com.blog.services.PostServices;
import com.blog.services.UserServices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ViewController {

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	private UserServices userServices;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PostServices postServices;

	@Autowired
	private PostRepository postRepository;

	@Autowired
	private CategoryServices categoryServices;

	@RequestMapping("/")
	public String home() {

		return "home";
	}

	@RequestMapping("/blog")
	public String about(Model mo) {

		List<Category> cl = this.categoryServices.getAllCategory();

		mo.addAttribute("cl", cl);
		return "blog";
	}

	@RequestMapping(path = "/showpost", method = { RequestMethod.POST, RequestMethod.GET })
	public String showpost(@RequestParam("cId") int cId, Model md) {

		try {

			Thread.sleep(250);
			List<Post> pl = null;
			if (cId == 0) {
				pl = this.postServices.getAllPost();
				md.addAttribute("pl", pl);

				return "showpost";
			} else {

				pl = this.postRepository.findByCatId(cId);
				System.out.println(cId);
				System.out.println(pl);

				if (pl == null) {
					System.out.println("No Content");
				} else {
					System.out.println(pl);
				}

				md.addAttribute("pl", pl);

				return "showpost";
			}

		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
			return "/";

		}

	}

	// @RequestMapping(path = "/showPostofUser", method = { RequestMethod.POST,
	// RequestMethod.GET })
	// public String showPostofUser(@RequestParam("uId") int uId, Model md) {

	// try {
	// Thread.sleep(250);

	// List<Post> postofUser = this.postRepository.findByUserId(uId);

	// md.addAttribute("pl", postofUser);

	// return "showpost";

	// } catch (Exception e) {
	// System.out.println(e.getMessage());
	// return "/";
	// }

	// }

	@RequestMapping("/signin")
	public String signin(Principal principal) {
		return "signin";
	}

	// @RequestMapping(path = "/signin/{urlParameter}", method = {
	// RequestMethod.GET, RequestMethod.POST })
	// public String signinError(@PathVariable("urlParameter") String param) {

	// System.out.println(param);

	// return "signin";
	// }

	@RequestMapping("/signup")
	public String signup(Model m) {
		// m.addAttribute("user", new User());
		return "signup";
	}

	@RequestMapping(path = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user,
			@RequestParam(name = "check", defaultValue = "false") boolean check, HttpSession session, Model m) {
		try {
			if (!check) {
				System.out.println("You have not agree the form");
				throw new Exception("You have not agree the form");
			}

			user.setReg_date(java.time.LocalDateTime.now());
			user.setProfile("default.png");
			user.setType("ROLE_NORMAL");
			user.setPassword(passwordEncoder.encode(user.getPassword()));

			// System.out.println(user);
			// System.out.println(check);

			User u = this.userServices.addUser(user);

			// m.addAttribute("user",u);

			session.setAttribute("message", new Message("Register Succesfully !!", "alert-success"));

			return "signup";

		} catch (Exception e) {
			// e.printStackTrace();
			// m.addAttribute("user", user)
			session.setAttribute("message", new Message("Something went wrong !!" + e.getMessage(), "alert-danger"));
			return "signup";

		}

	}

	// @RequestMapping(path = "/validation", method = RequestMethod.POST)
	// public String validation(@RequestParam("username") String email,
	// @RequestParam("password") String password) {
	//
	// User user = null;
	// user = this.userRepository.getUserByUserName(email);
	// System.out.println(user.getType());
	// if(user.getType().equals("ROLE_NORMAl")) {
	// return "redirect:/blog";
	// }else {
	// return "redirect:admin";
	// }
	// }

}
