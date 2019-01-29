package by.protasenya.curseProject.repo;

import by.protasenya.curseProject.domain.Letter;
import by.protasenya.curseProject.domain.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Set;

public interface LetterRepo extends CrudRepository<Letter, Long> {
    List<Letter> findByAuthor(User user);
    List<Letter> findByProfession(String profession);
    List<Letter> findByAuthorAndSigned(User user, String signed);
    List<Letter> findBySenderAndSignedNot(String sender, String signed);
    List<Letter> findByAuthorAndLettername(User user, String name);
    List<Letter> findByProfessionAndLettername(String profession, String name);
    List<Letter> findByAuthorAndSignedAndLettername(User user, String signed, String name);
    List<Letter> findBySenderAndSignedNotAndLettername(String sender, String signed, String name);
}