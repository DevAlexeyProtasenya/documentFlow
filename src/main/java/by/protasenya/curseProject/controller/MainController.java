package by.protasenya.curseProject.controller;

import by.protasenya.curseProject.domain.Letter;
import by.protasenya.curseProject.domain.User;
import by.protasenya.curseProject.repo.LetterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {
    @Autowired
    private LetterRepo letterRepo;

    @Value("${upload.path}")
    private String uploadPath;

    private final String path = System.getProperty("user.dir");

/*    @GetMapping("/")
    public String greeting() {
        return "greeting";
    }*/

    @GetMapping("/main/allLetter")
    public String main(Model model) {
        Iterable<Letter> letters = letterRepo.findAll();
        model.addAttribute("letters", letters);
        return "main";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @GetMapping("/main/{letter}")
    public String userEditForm(@PathVariable Letter letter, Model model) {
        model.addAttribute("letter", letter);
        return "signing";
    }

    @GetMapping(value = {"/main", "/"})
    public String myLetter(Model model, @AuthenticationPrincipal User user, @RequestParam(defaultValue = "") String search) {
        Iterable<Letter> myLetter;
        if (search != null && !search.equals("")) {
            myLetter = letterRepo.findByAuthorAndLettername(user, search);
        } else {
            myLetter = letterRepo.findByAuthor(user);
        }
        model.addAttribute("letters", myLetter);
        return "main";
    }

    @GetMapping("/main/toMe")
    public String toMeLetter(Model model, @AuthenticationPrincipal User user, @RequestParam(defaultValue = "") String search) {
        Iterable<Letter> myLetter;
        if (search != null && !search.equals("")) {
            myLetter = letterRepo.findByProfessionAndLettername(user.getProfession(), search);
        } else {
            myLetter = letterRepo.findByProfession(user.getProfession());
        }
        model.addAttribute("letters", myLetter);
        return "main";
    }

    @GetMapping("/main/unsigned")
    public String unsigned(Model model, @AuthenticationPrincipal User user, @RequestParam(defaultValue = "") String search) {
        Iterable<Letter> myLetter;
        if (search != null && !search.equals("")) {
            myLetter = letterRepo.findByAuthorAndSignedAndLettername(user, "Не подписано", search);
        } else {
            myLetter = letterRepo.findByAuthorAndSigned(user, "Не подписано");
        }
        model.addAttribute("letters", myLetter);

        return "main";
    }

    @GetMapping("/main/signed")
    public String signed(Model model, @AuthenticationPrincipal User user, @RequestParam(defaultValue = "") String search) {
        Iterable<Letter> myLetter;
        if (search != null && !search.equals("")) {
            myLetter = letterRepo.findBySenderAndSignedNotAndLettername(user.getProfession(), "Не подписано", search);
        } else {
            myLetter = letterRepo.findBySenderAndSignedNot(user.getProfession(), "Не подписано");
        }
        model.addAttribute("letters", myLetter);
        return "main";
    }

    @PostMapping(value = {"/", "/main", "/main/allLetter", "/main/toMe", "/main/unsigned", "/main/signed"})
    public String add(
            @AuthenticationPrincipal User user,
            @Valid Letter letter,
            BindingResult bindingResult,
            Model model,
            @RequestParam("file") MultipartFile file
    ) throws IOException {
        letter.setAuthor(user);
        letter.setSigned("Не подписано");
        letter.setSender(user.getProfession());
        letter.setDate(new Date());
        letter.setSignDate(null);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("letter", letter);
        } else {
            if (file != null && !file.getOriginalFilename().isEmpty()) {
                File uploadDir = new File(path + uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }
                String uuidFile = UUID.randomUUID().toString();
                String resultFilename = uuidFile + "." + file.getOriginalFilename();
                file.transferTo(new File(path + uploadPath + "/" + resultFilename));
                letter.setFilename(resultFilename);
            }
            model.addAttribute("message", null);
            letterRepo.save(letter);
        }
        Iterable<Letter> letters = letterRepo.findByAuthor(user);
        model.addAttribute("letters", letters);
        return "main";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("letter")
    public String letterSave(
            @AuthenticationPrincipal User user,
            @RequestParam("letterId") Letter letter
    ) {
        letter.setSigned(user.getProfession());
        letter.setSignDate(new Date());
        letterRepo.save(letter);
        return "redirect:/main";
    }

    @PostMapping("letterCancel")
    public String letterCancel(
            @AuthenticationPrincipal User user,
            @RequestParam("letterId") Letter letter
    ) {
        letter.setSigned("В подписании отказано!");
        letter.setSignDate(new Date());
        letterRepo.save(letter);
        return "redirect:/main";
    }

    @PostMapping("/delete/{letter}")
    public String letterDelete(
            @AuthenticationPrincipal User user,
            @RequestParam("letterId") Letter letter
    ) {
        letterRepo.delete(letter);
        return "redirect:/main";
    }
}
