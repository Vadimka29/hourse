package ua.com.iweb.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.GalleryDAO;
import ua.com.iweb.dao.SliderDAO;
import ua.com.iweb.enteties.GalleryEntity;
import ua.com.iweb.enteties.SliderEntity;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.GregorianCalendar;

/**
 * Created by vanya on 24.03.15.
 */
@Controller
public class GalleryController {
    @Autowired
    private ServletContext context;
    @RequestMapping(value = "/add_to_gallery", method = RequestMethod.POST,  consumes="multipart/form-data")
    @ResponseStatus(HttpStatus.OK)
    public String addPhoto(@RequestParam("gallery_item") MultipartFile file     ) throws IOException {
        System.out.println("Image: " + file     .getOriginalFilename());
        //save photo to folder
        final String destinationPath = context.getRealPath("/") + "resources/uploads/gallery";
        GregorianCalendar calendar = new GregorianCalendar();
        File destinationFile = new File(destinationPath + "/" +
                calendar.hashCode() +"" + file     .getOriginalFilename());
        if(!destinationFile.exists()) {
            file     .transferTo(destinationFile);
            GalleryEntity photo = new GalleryEntity();
            photo.setCreateDate(new Date(calendar.getTimeInMillis()));
            photo.setDescription(calendar.hashCode() + "" + file     .getOriginalFilename());
            ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
            GalleryDAO galleryDAO = (GalleryDAO) context.getBean("galleryDAO");
            try {
                galleryDAO.addPhoto(photo);
            } catch (SQLException e) {
                System.out.println("Can't save photo do db!");
            }
        }
        return "redirect:/admin/gallery";
        //return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/gallery");
    }
    @RequestMapping(value = "/add_to_slider", method = RequestMethod.POST,  consumes="multipart/form-data")
    @ResponseStatus(HttpStatus.OK)
    public String addPhotoToSlider(@RequestParam("slider_item") MultipartFile file     ) throws IOException {
        System.out.println("Image: " + file     .getOriginalFilename());
        //save photo to folder
        final String destinationPath = context.getRealPath("/") + "resources/uploads/slider";
        GregorianCalendar calendar = new GregorianCalendar();
        File destinationFile = new File(destinationPath + "/" +
                calendar.hashCode() +"" + file     .getOriginalFilename());
        if(!destinationFile.exists()) {
            file     .transferTo(destinationFile);
            SliderEntity photo = new SliderEntity();
            photo.setCreateDate(new Date(calendar.getTimeInMillis()));
            photo.setDescription(calendar.hashCode() + "" + file     .getOriginalFilename());
            ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
            SliderDAO sliderDAO = (SliderDAO) context.getBean("sliderDAO");
            try {
                sliderDAO.addPhoto(photo);
            } catch (SQLException e) {
                System.out.println("Can't save photo do db!");
            }
        }
        return "redirect:/admin/slider";
    }
    @RequestMapping(value = "/remove_from_gallery", method = RequestMethod.DELETE)
    public  void delelePhotoFromGallery(@RequestBody String photoNames){
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        GalleryDAO galleryDAO = (GalleryDAO) context.getBean("galleryDAO");
        String[] names = photoNames.split(" ");
        for(int i = 0; i < names.length; i++){
            System.out.println(names[i]);
            try {
                galleryDAO.deletePhoto(names[i]);
            } catch (SQLException e) {
                System.out.println("Can't delete photo");
            }
        }
    }
}
