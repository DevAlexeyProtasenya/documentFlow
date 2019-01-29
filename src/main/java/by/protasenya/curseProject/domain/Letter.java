package by.protasenya.curseProject.domain;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.util.Date;

@Entity
public class Letter {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User author;

    @NotBlank(message = "Please fill the name of the letter")
    @Length(max = 100, message = "Name too long")
    private String lettername;

    //@DateTimeFormat(pattern="dd/MM/yyyy HH:mm:ss")
    //@NotNull
    //@Past
    private Date date;

    //@DateTimeFormat(pattern="dd/MM/yyyy HH:mm:ss")
    //@NotNull
   // @Past
    private Date signDate;

    private String signed;

    private String profession;

    private String sender;

    private String filename;

    public Letter() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getLettername() {
        return lettername;
    }

    public void setLettername(String lettername) {
        this.lettername = lettername;
    }

    public String getSigned() {
        return signed;
    }

    public void setSigned(String signed) {
        this.signed = signed;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public Date getDate() {
        return date;
    }

    public String getDateTime(){
        return date.toString();
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getSignDate() {
        return signDate;
    }

    public void setSignDate(Date signDate) {
        this.signDate = signDate;
    }
}
