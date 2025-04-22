package com.grepp.spring.infra.error;

import com.grepp.spring.infra.error.exceptions.CommonException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice(basePackages = "com.grepp.spring.app.controller.web")
public class WebExceptionAdvice {
    
    @ExceptionHandler(CommonException.class)
    public String webExceptionHandler(CommonException ex, Model model) {
        model.addAttribute("message", ex.code().message());
        return "error/redirect";
    }
}
