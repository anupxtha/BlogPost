package com.blog.helper;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileUploadHelper {

  // ClassPathResource throw exception when contructor run as calling this class
  // so to handle we did this
  public FileUploadHelper() throws IOException {
  }

  public final String UPLOAD_DIR = "C:\\Users\\Anup-Xtha\\Documents\\workspace-spring-tool-suite-4-4.11.1.RELEASE\\blog\\target\\classes\\static\\image";

  // public final String UPLOAD_DIR = new
  // ClassPathResource("static/image").getFile().getAbsolutePath();

  public boolean uploadFile(MultipartFile file) {
    boolean f = false;

    try {

      Files.copy(file.getInputStream(), Paths.get(UPLOAD_DIR + File.separator + file.getOriginalFilename()),
          StandardCopyOption.REPLACE_EXISTING);

      f = true;

    } catch (Exception e) {
      e.printStackTrace();
    }

    return f;
  }

}
