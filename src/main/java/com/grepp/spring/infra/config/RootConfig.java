package com.grepp.spring.infra.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {
    "com.grepp.spring.infra",
    "com.grepp.spring.app"
})
public class RootConfig {
}