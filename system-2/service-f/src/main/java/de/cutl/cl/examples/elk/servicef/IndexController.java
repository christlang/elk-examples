package de.cutl.cl.examples.elk.servicef;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
        log.trace("trace index");
        log.debug("debug index");
        log.info("info index");
        log.warn("warn index");
        log.error("error index", new RuntimeException("this is a example"));
        return "index";
    }
}
