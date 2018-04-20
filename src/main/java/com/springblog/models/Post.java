package com.springblog.models;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import org.springframework.stereotype.Component;

@Entity
@Component
@Table(name = "POST")
@SequenceGenerator(name = "SeqPostId", sequenceName = "SEQPOSTID", initialValue = 1, allocationSize = 1)
public class Post implements Serializable {

    private static final long serialVersionUID = 2912945815896575160L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID")
    private int id;

    @Column(name = "TITLE", length = 255, nullable = false)
    private String title;

    @Column(name = "BRIEFING", length = 255, nullable = false)
    private String briefing;

    @Column(name = "TEXT", length = 10485760, nullable = false)
    private String text;

    @Lob
    @Column(name = "PICTURE", nullable = true)
    private byte[] picture;
    
    @Column(name = "DATEPOST", nullable = false)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date datePost;
    
    @Column(name = "DATEUPDATE", nullable = true)
    @Temporal(javax.persistence.TemporalType.TIMESTAMP)
    private Date dateUpdate;

    @ManyToOne
    @JoinColumn(name = "AUTHOR_ID")
    private Author author;
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBriefing() {
        return briefing;
    }

    public void setBriefing(String briefing) {
        this.briefing = briefing;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public byte[] getPicture() {
        return picture;
    }

    public void setPicture(byte[] picture) {
        this.picture = picture;
    }
    
    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }
    
    public Date getDatePost() {
        return datePost;
    }

    public void setDatePost(Date datePost) {
        this.datePost = datePost;
    }

    public Date getDateUpdate() {
        return dateUpdate;
    }

    public void setDateUpdate(Date dateUpdate) {
        this.dateUpdate = dateUpdate;
    }
}
