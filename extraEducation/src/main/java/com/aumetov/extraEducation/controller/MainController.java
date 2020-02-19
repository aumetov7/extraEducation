package com.aumetov.extraEducation.controller;

import com.aumetov.extraEducation.domain.School;
import com.aumetov.extraEducation.domain.User;
import com.aumetov.extraEducation.repository.SchoolRepository;
import com.aumetov.extraEducation.repository.UserRepository;
import com.aumetov.extraEducation.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private SchoolRepository schoolRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SchoolService schoolService;

    @Value("${upload.path}")
    private String uploadPath;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @PreAuthorize("hasAuthority('USER') || hasAuthority('DIRECTOR')")
    @GetMapping("/main")
    public String main(@RequestParam(required = false, defaultValue = "") String filter, Model model) {
        Iterable<School> schools = schoolRepository.findAll();

        if (filter != null && !filter.isEmpty()) {
            schools = schoolRepository.findByTag(filter);
        } else {
            schools = schoolRepository.findAll();
        }

        model.addAttribute("schools", schools);
        model.addAttribute("filter", filter);
        return "main";
    }

    @PostMapping("/main")
    public String addNewSchool(
            @AuthenticationPrincipal User user,
            @Valid School school,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        school.setAuthor(user);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorsMap);
            model.addAttribute("school", school);
        } else {
            saveFile(school, file);

            model.addAttribute("school", null);

            schoolRepository.save(school);
        }

        Iterable<School> schools = schoolRepository.findAll();
        model.addAttribute("schools", schools);

        return "main";
    }

    private void saveFile(@Valid School school, @RequestParam("file") MultipartFile file) throws IOException {
        if (file != null && !file.getOriginalFilename().isEmpty()) {
            File uploadDirectory = new File(uploadPath);

            if (!uploadDirectory.exists()) {
                uploadDirectory.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));

            school.setFilename(resultFilename);
        }
    }

    @PreAuthorize("hasAuthority('USER') || hasAuthority('DIRECTOR')")
    @GetMapping("/user-schools/{user}")
    public String userSchools(@AuthenticationPrincipal User currentUser,
                              @PathVariable User user,
                              Model model,
                              @RequestParam(required = false) School school
    ) {
        Set<School> schools = user.getSchools();

        model.addAttribute("userChannel", user);
        model.addAttribute("subscriptionsCount", user.getSubscriptions().size());
        model.addAttribute("subscribersCount", user.getSubscribers().size());
        model.addAttribute("isSubscriber", user.getSubscribers().contains(currentUser));
        model.addAttribute("schools", schools);
        model.addAttribute("school", school);
        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "userSchools";
    }

    @PostMapping("/user-schools/{user}")
    public String updateSchool(
            @AuthenticationPrincipal User currentUser,
            @AuthenticationPrincipal User admin,
            @PathVariable User user,
            @RequestParam("id") School school,
            @RequestParam("name") String name,
            @RequestParam("text") String text,
            @RequestParam("tag") String tag,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        if (school.getAuthor().equals(currentUser) || admin.getUsername().equals("admin")) {
            if (!StringUtils.isEmpty(name)) {
                school.setName(name);
            }
            if (!StringUtils.isEmpty(text)) {
                school.setText(text);
            }

            if (!StringUtils.isEmpty(tag)) {
                school.setTag(tag);
            }

            saveFile(school, file);

            schoolRepository.save(school);
        }

        return "redirect:/user-schools/" + user.getId();
    }

    @GetMapping("/school-delete/delete/{user}")
    public String schoolDeletePage(@AuthenticationPrincipal User currentUser,
                              @PathVariable User user,
                              Model model,
                              @RequestParam(required = false) School school
    ) {
        Set<School> schools = user.getSchools();

        model.addAttribute("schools", schools);
        model.addAttribute("school", school);
        model.addAttribute("isCurrentUser", currentUser.equals(user));

        return "deleteSchool";
    }

    @PostMapping("/school-delete/delete/{user}")
    public String deleteSchoolConfirm(
            @AuthenticationPrincipal User currentUser,
            @AuthenticationPrincipal User admin,
            @PathVariable User user,
            @RequestParam("id") School school
    ) throws IOException {
        if (school.getAuthor().equals(currentUser) || admin.getUsername().equals("admin")) {
            deleteSchool(school);
        }
        return "redirect:/user-schools/" + user.getId();
    }

    private void deleteSchool (@RequestParam(required = false) School school){
        schoolService.delete(school);
    }



}
