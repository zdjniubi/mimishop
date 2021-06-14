package com.zdj.miaoshaproject;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * Hello world!
 *
 */
@SpringBootApplication(scanBasePackages = {"com.zdj.miaoshaproject"})
@MapperScan("com.zdj.miaoshaproject.dao")
@EnableScheduling
public class App {

    public static void main( String[] args ) {
        SpringApplication.run(App.class,args);
    }
}
