package com.ouliang;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//(exclude = {DataSourceAutoConfiguration.class})
@SpringBootApplication
public class YunApplication {

    public static void main(String[] args) {
        SpringApplication.run(YunApplication.class, args);
    }

}
