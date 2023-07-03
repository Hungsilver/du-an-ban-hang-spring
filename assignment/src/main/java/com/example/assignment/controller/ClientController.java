package com.example.assignment.controller;

import com.example.assignment.entity.Role;
import com.example.assignment.entity.User;
import com.example.assignment.service.RoleService;
import com.example.assignment.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ClientController {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private JavaMailSender mailSender;




    @GetMapping("/login")
    private String showLogin() {
        return "/auth/login";
    }

    @PostMapping("/login")
    private String login(
            Model model,
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session,
            RedirectAttributes rdr
    ) {
        User user = userService.getUserByEmailAndPassWord(email, password);
        if (user == null) {
            rdr.addFlashAttribute("alert", "Tên tài khoản hoặc mật khẩu không đúng");
            return "redirect:/login";
        }
        session.setAttribute("userLogin", user);
        return "redirect:/home";
    }

    @GetMapping("/log-out")
    private String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/home";
    }

    @GetMapping("/register")
    private String showRegister() {
        return "/auth/register";
    }

    @GetMapping("/reset-pass")
    private String showResetPass() {
        return "/auth/reset-pass";
    }

    @PostMapping("/reset-pass")
    private String resetPass() {

        return "redirect:/login";
    }


    @GetMapping("user/profile/{id}")
    private String showProfile(Model model, @PathVariable("id") Long idUser) {
        User user = userService.getOne(idUser);
        model.addAttribute("user", user);
        return "client/profile";
    }

    @PostMapping("user/profile/changePass/{id}")
    private String changepass(Model model,
                              @PathVariable("id") Long idUser,
                              @RequestParam("passOld") String passOld,
                              @RequestParam("passNew") String passNew
    ) {
        User user = userService.getOne(idUser);
        if (user.getPassword().equals(passOld)) {
            user.setPassword(passNew);
            userService.update(user);
        }
        model.addAttribute("user", user);
//        return "redirect:/client/profile";user
        return "redirect:/user/profile/" + idUser;
    }

    @PostMapping("user/profile/{id}")
    private String updateProfile(Model model,
                                 @PathVariable("id") Long idUser,
                                 @ModelAttribute User user
    ) {
        User userDB = userService.getOne(idUser);
        user.setStatus(1);
        user.setId(idUser);
        user.setImage(userDB.getImage());
        user.setPassword(userDB.getPassword());
        userService.add(user);
        System.out.println(user);
        return "client/profile";
    }

    @GetMapping("/forgot-pass")
    private String forgotPass(Model model,
                              @RequestParam("email") String email
    ) {
//        User user = userService.getOne(idUser);
//        model.addAttribute("user", user);
        return "client/profile";
    }
}
